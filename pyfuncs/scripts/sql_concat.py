# -*- coding: utf-8 -*-
"""
@create: 2019-06-17 19:32:53.

@author: ppolxda

@desc: concat_file
"""
import os
import glob
import codecs
import argparse


class Cmdoptions(object):

    def __init__(self):
        u"""初始化函数."""
        parser = argparse.ArgumentParser(
            description='pyfuncs.scripts.file_concat')

        parser.add_argument('-i', '--input',
                            default='./**/*.sql',
                            help='输入sql脚本目錄(glob)')

        parser.add_argument('-o', '--output',
                            default=None,
                            help='输出sql脚本文件')

        parser.add_argument('-s', '--comment_symbol',
                            default='--',
                            help='注释格式')

        parser.add_argument('-r', '--relpath',
                            default=TabError,
                            help='显示相对目录')

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='文件编码设置（默认：utf8）')

        args = parser.parse_args()

        self.input = args.input
        self.encoding = args.encoding
        self.output = args.output
        self.comment_symbol = args.comment_symbol
        self.relpath = args.relpath
        self.sqls = glob.glob(self.input, recursive=True)

        if self.output is None:
            self.output = os.path.dirname(self.input)

        if not self.output or os.path.isdir(self.output):
            raise TypeError('--output invaild')


def main():
    opts = Cmdoptions()

    concats = []
    for path in opts.sqls:
        with codecs.open(path, 'r', encoding=opts.encoding) as fs:
            data = fs.read().strip()

        if opts.relpath:
            path = os.path.relpath(path)

        concats += [
            '',
            '',
            opts.comment_symbol + ' -------------------------------------',
            opts.comment_symbol + '         {path}'.format(path=path),
            opts.comment_symbol + ' -------------------------------------'
            '',
            '',
            data
        ]

    with codecs.open(opts.output, 'w', encoding=opts.encoding) as fs:
        fs.write('\n'.join(concats))


if __name__ == '__main__':
    main()
