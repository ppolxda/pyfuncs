# -*- coding: utf-8 -*-
from __future__ import unicode_literals, division, print_function, absolute_import  # noqa
import re
import sys
import argparse
from os import walk
from os.path import isfile, join
from pyfuncs.scripts import line_break as lb

SUFFIX_REGIX = re.compile(r'^\*.[a-zA-z9-9]{1,}$')


def main():
    parser = argparse.ArgumentParser(
        description='line_break_conv.')
    parser.add_argument('path', nargs='?', help='file path(file | dir)')
    parser.add_argument(
        '--mode', help='file mode(win|mac|unix) default:system')
    parser.add_argument('--encode', help='file encode default:utf8')
    parser.add_argument('--suffix', help='suffix filter(ex: *.go,*.py)')
    args = parser.parse_args()

    if not args.path:
        print('You must supply a path\n', file=sys.stderr)
        parser.print_help()
        return

    if not args.mode:
        args.mode = None

    if not args.encode:
        args.encode = 'utf8'

    if not args.suffix:
        args.suffix = []
    else:
        args.suffix = args.suffix.split(',')
        args.suffix = [val[val.rfind('.'):] for val in args.suffix
                       if re.match(SUFFIX_REGIX, val) is not None]

    if isfile(args.path):
        try:
            print(args.path)
        except IOError as ex:
            print('ioerr', ex)
        lb.conv_file(args.path, args.mode, args.encode)
    else:
        # onlyfiles = [f for f in listdir(
        #     args.path) if isfile(join(args.path, f))]
        # print(onlyfiles)

        for root, _, files in walk(args.path):
            for name in files:
                suffix = name[name.rfind('.'):]
                filepath = join(root, name)

                if args.suffix and suffix not in args.suffix:
                    continue

                try:
                    print(filepath)
                except IOError as ex:
                    print('ioerr', ex)
                lb.conv_file(filepath, args.mode, args.encode)

            # for name in dirs:
                # print(os.path.join(root, name))


if __name__ == '__main__':
    main()
