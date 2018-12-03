# -*- coding: utf-8 -*-
u"""
@create: 2017-02-06 15:40:25.

@author: zhida

@desc: 生成日志配置文件
"""
from __future__ import absolute_import, division, print_function, unicode_literals  # noqa
import os
import json
import codecs
import argparse
from tornado import template


class Cmdoptions(object):

    def __init__(self):
        u"""初始化函数."""
        FILEPATH = os.path.abspath(os.path.dirname(__file__))
        TMPLPATH_DEFINE = '{tmpl}'
        TMPLPATH = FILEPATH + '/template'

        parser = argparse.ArgumentParser(
            description='pyfuncs.genconf.logger_conf_maker')

        parser.add_argument('-i', '--input',
                            default='{tmpl}/logger_default.json',
                            help='输入配置json')

        parser.add_argument('-o', '--output',
                            default='./logging',
                            help='输出目录')

        parser.add_argument('-of', '--output_fmt',
                            default='logging_{0:02d}.ini',
                            help='输出文件名格式')

        parser.add_argument('-t', '--tmpl',
                            default='{tmpl}/logger_template.ini',
                            help='引用模板文件')

        parser.add_argument('-c', '--count',
                            type=int,
                            default=11,
                            help='生成数量')

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='文件编码设置（默认：utf8）')

        args = parser.parse_args()

        self.input = args.input.replace(TMPLPATH_DEFINE, TMPLPATH)
        self.tmpl = args.tmpl.replace(TMPLPATH_DEFINE, TMPLPATH)
        self.count = args.count
        self.output = args.output
        self.output_fmt = args.output_fmt
        self.encoding = args.encoding

        if not os.path.exists(self.input) or not os.path.isfile(self.input):
            raise TypeError('输入配置json无效')

        if not os.path.exists(self.tmpl) or not os.path.isfile(self.tmpl):
            raise TypeError('输入配置tmpl无效')

        if not os.path.exists(self.output) or not os.path.isdir(self.output):
            raise TypeError('输出目录无效')

        with codecs.open(self.tmpl, 'r', encoding=self.encoding) as fs:
            self.tmpl = template.Template(fs.read())

        with codecs.open(self.input, 'r', encoding=self.encoding) as fs:
            self.input = json.loads(fs.read())


def main():
    opts = Cmdoptions()

    for i in range(opts.count):
        assert isinstance(opts.input, list)
        config_data = opts.tmpl.generate(loggers=opts.input, index=i)

        with codecs.open(opts.output + '/' + opts.output_fmt.format(i),
                         'w', encoding=opts.encoding) as fs:
            fs.write(config_data.decode(opts.encoding))


if __name__ == '__main__':
    main()
