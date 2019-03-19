# -*- coding: utf-8 -*-
u"""
@create: 2017-02-06 15:40:25.

@author: zhida

@desc: 生成银行nginx配置文件
"""
from __future__ import unicode_literals, division, print_function, absolute_import  # noqa
import os
import re
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

JSON_CHECK = {
    'service_name': six.string_types,
    'progam_name': six.string_types,
    'progam_cwd': six.string_types,
    'progam_run_mode': six.string_types,
    'progam_desc': list,
    'progam_args': list,
    'supervisord_args': list,
}


SARGS = ["command", "process_name", "numprocs", "directory", "umask",
         "priority", "autostart", "autorestart", "startsecs", "startretries",
         "exitcodes", "stopsignal", "stopwaitsecs", "stopasgroup",
         "killasgroup", "user", "redirect_stderr", "stdout_logfile",
         "stdout_logfile_maxbytes", "stdout_logfile_backups",
         "stdout_capture_maxbytes", "stdout_events_enabled",
         "stderr_logfile", "stderr_logfile_maxbytes",
         "stderr_logfile_backups", "stderr_capture_maxbytes",
         "stderr_events_enabled", "environment", "serverurl"]

SARGS += ['numprocs_start']

SARGS_REGEX = re.compile(
    r'^;?({0})[ ]?=[ ]?([^ ]*?)[ ]?$'.format('|'.join(SARGS)))


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

    if 'common_args' not in config_json:
        config_json['common_args'] = {}

    not_has_process_name = True

    for server in config_json['servers']:
        for key, _types in JSON_CHECK.items():
            if key not in server or not isinstance(server[key], _types):
                raise TypeError('无效{}参数[{}]'.format(
                    key, server['service_name']))

            if isinstance(server[key], six.string_types):
                server[key] = server[key].format(**config_json['common_args'])

            if isinstance(server[key], list):
                server[key] = [
                    x.format(**config_json['common_args'])
                    if isinstance(x, six.string_types) else x
                    for x in server[key]
                ]

        for i in server['supervisord_args']:
            if SARGS_REGEX.match(i) is None:
                raise TypeError('无效supervisord_args参数[{}][{}]'.format(
                    server['service_name'], i))

            if i.find('process_name') >= 0:
                not_has_process_name = False

    if not_has_process_name:
        server['supervisord_args'].append('process_name=%(program_name)s')

    config_json['servers'] = [
        i for i in config_json['servers']
        if i.get('progam_open', True)
    ]


def main():
    parser = argparse.ArgumentParser(description='supervisord_maker.')
    parser.add_argument('--path', help='file path')
    parser.add_argument(
        '--tmpl_path', help='file path default:{pyfunc}/'
        'genconf/template/supervisord_template.conf')
    parser.add_argument(
        '--out_path', help='file path default:./output/nginx.conf')
    parser.add_argument(
        '--print_desc', help='print_desc', type=bool, default=True)
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
        print_desc=args.print_desc,
        run_mode=config_json['run_mode']
    )
    save_conf(args.out_path, data, args.encode)


if __name__ == '__main__':
    main()
