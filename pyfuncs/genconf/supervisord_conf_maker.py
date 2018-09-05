# -*- coding: utf-8 -*-
u"""
@create: 2017-02-06 15:40:25.

@author: zhida

@desc: 生成银行nginx配置文件
"""
from __future__ import unicode_literals, division, print_function, absolute_import  # noqa
import os
import sys
import six
import codecs
import argparse
import jk_commentjson
from tornado import template

# # 获取工作路径
# workpath = os.getcwd() + '/'
# # 加载模板文件目录
# template_loader = template.Loader(os.path.join(workpath, 'template'))
# # 输出文件目录
# output_path = './output/'
# # 指定模板文件
# template_obj = template_loader.load('nginx_template.conf')


def open_conf(path='service_config.json', encoding='utf8'):
    u"""打开数据源文件，并解析json配置改为字典操作."""
    with codecs.open(path, 'r', encoding=encoding) as fs:
        buf = fs.read()
    return jk_commentjson.loads(buf)


def save_conf(path, data, encoding='utf8'):
    u"""输出文件落地保存."""
    if isinstance(data, six.binary_type):
        data = data.decode('utf8')

    buf = codecs.open(path, 'w', encoding=encoding)
    buf.write(data)
    buf.close()


def init_config(config_json):
    server_names = [val['service_name'] for val in config_json['servers']]
    server_names.sort()

    # 检查server_names是否重复
    if len(server_names) != len(set(server_names)):
        raise Exception(
            'servers 配置错误 service_name名称重复 ')

    port_set = {}
    http_config_port = set()
    for val in config_json['servers']:

        if val['progam_run_mode'] not in config_json['run_mode']:
            raise Exception(
                'run_mode 配置错误 [service_name {}][run_mode {}]'.format(
                    val['service_name'], val['progam_run_mode']))

        # 检查端口范围
        ports = val['progam_ports']
        ports[1] += 1

        if ports[1] <= 1000 or ports[0] <= 1000:
            raise Exception(
                'ports 配置错误 [service_name {}][ports {}]'.format(
                    val['service_name'], ports))

        if not (0 <= (ports[1] - ports[0]) <= 99):
            raise Exception(
                'ports 配置错误 [service_name {}][ports {}]'.format(
                    val['service_name'], ports))

        if val['progam_addr'] not in port_set:
            port_set[val['progam_addr']] = set()

        port_check = val.get('progam_port_check', True)
        if port_check:
            for i in range(ports[0], ports[1]):
                if i in port_set[val['progam_addr']]:
                    raise Exception(
                        'ports 配置错误 端口冲突 [service_name {}][ports {}]'.format(
                            val['service_name'], ports))
                port_set[val['progam_addr']].add(i)

        val['port_high'] = int((ports[0] - (ports[0] % 100)) / 100)
        val['port_low_min'] = int(min([ports[0] % 100, ports[1] % 100]))
        val['port_low_diff'] = int(ports[1] - ports[0])
        # print(val)

    config_json['servers'] = [
        i for i in config_json['servers']
        if i.get('progam_open', True)
    ]


def main():
    parser = argparse.ArgumentParser(description='nginx_conf_maker.')
    parser.add_argument('--path', help='file path')
    parser.add_argument(
        '--tmpl_path', help='file path default:{pyfunc}/'
        'genconf/template/nginx_template.conf')
    parser.add_argument(
        '--out_path', help='file path default:./output/nginx.conf')
    parser.add_argument('--encode', help='file encode default:utf8')
    args = parser.parse_args()

    if not args.path:
        print('You must supply a path\n', file=sys.stderr)
        parser.print_help()
        return

    if not args.out_path:
        args.out_path = './output/nginx.conf'

    if not args.tmpl_path:
        pkg_path = os.path.abspath(os.path.dirname(__file__))
        args.tmpl_path = pkg_path + '/template/supervisord_template.conf'

    if not args.encode:
        args.encode = 'utf8'

    with codecs.open(args.tmpl_path, encoding=args.encode) as fs:
        template_obj = template.Template(fs.read())
    config_json = open_conf(args.path, args.encode)
    init_config(config_json)

    data = template_obj.generate(
        servers=config_json['servers'],
        run_mode=config_json['run_mode']
    )
    save_conf(args.out_path, data, args.encode)


if __name__ == '__main__':
    main()
