# -*- coding: utf-8 -*-
u"""
@create: InsertDatetimeString(Ctrl+Shift+I).

@author: name

@desc: 文件功能描述
"""
from __future__ import absolute_import, division, print_function

import re
import os
import sys
import shutil

INDEX_REGIX = re.compile(r'^[0-9]{2}')
DEFAULT_PATH = './'


def try_regix(val):
    if not (val.find('^') < 0 and val.find('$') < 0):
        return val

    val = val.replace('[', '\\[').replace(']', '\\]')
    val = val.replace('(', '\\(').replace(')', '\\)')
    val = val.replace('.', '\\.')
    val = val.replace('{num}', '([0-9]{1,3})')
    val = val.replace('{str}', '.*?')
    return re.compile(r'^{0}$'.format(val))


def main():
    if len(sys.argv) < 3:
        raise Exception('sys.argv error')
        # video_regix = default_video_re
        # sub_regix = default_su_re
    else:
        # 自动尝试添加通配符
        video_regix = try_regix(sys.argv[1])
        sub_regix = try_regix(sys.argv[2])
        suffix = sys.argv[3] if len(sys.argv) > 3 else ''

    print('vregix:', sys.argv[1])
    print('sregix:', sys.argv[2])

    vfile = {re.match(video_regix, name).group(1): name
             for name in os.listdir(DEFAULT_PATH)
             if re.match(video_regix, name) is not None and
             len(re.match(video_regix, name).groups()) == 1 and
             re.match(INDEX_REGIX, re.match(video_regix, name).group(1)) is not None}

    sfile = {re.match(sub_regix, name).group(1): name
             for name in os.listdir(DEFAULT_PATH)
             if re.match(sub_regix, name) is not None and
             len(re.match(sub_regix, name).groups()) == 1 and
             re.match(INDEX_REGIX, re.match(sub_regix, name).group(1)) is not None}

    count = 1
    for index, path in sfile.items():
        if index not in vfile:
            continue

        vpath = vfile[index]
        outpath = vpath[:vpath.rfind('.')] + suffix + path[path.rfind('.'):]
        shutil.copy(path, outpath)
        print('count:', count, 'index:', index, 'file:', outpath)
        count = count + 1


if __name__ == '__main__':
    main()
