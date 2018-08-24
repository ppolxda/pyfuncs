# -*- coding: utf-8 -*-
from __future__ import unicode_literals, division, print_function, absolute_import  # noqa
import re
import os
import sys
# import tempfile
import codecs
from shutil import copy
from pyfuncs.string_unit import decode_str


__CHANGE_REGIX = re.compile(r'(\r\n|\r|\n)')

MODE_WINDOWS = 'win'
MODE_MAC = 'mac'
MODE_UNIX = 'unix'
MODE_DEFAULT = MODE_UNIX
MODES = [MODE_WINDOWS, MODE_MAC, MODE_UNIX]

WINDOWS_LINE = '\r\n'
MAC_LINE = '\r'
UNIX_LINE = '\n'


# def read_data(path, encoding=None):
#     if sys.version_info[0] == 3:
#         return open(path, mode='r', encoding=encoding).read()
#     else:
#         if encoding is not None:
#             return open(path, mode='r').read().decode(encoding)
#         else:
#             return open(path, mode='r').read()


# def write_data(path, data, encoding=None):
#     if sys.version_info[0] == 3:
#         return open(path, mode='w', encoding=encoding).write(data)
#     else:
#         if encoding is not None:
#             return open(path, mode='w').write(data.encode(encoding))
#         else:
#             return open(path, mode='w').write(data)


def conv_file(filepath, mode=None, encoding=None, out_filepath=None):
    filepath = decode_str(filepath)
    if not os.path.isfile(filepath):
        raise Exception('filepath is not file: %s' % filepath)

    if mode not in MODES:
        if sys.platform.startswith('linux'):
            mode = MODE_UNIX
        elif sys.platform.startswith('win32') or \
                sys.platform.startswith('cygwin'):
            mode = MODE_WINDOWS
        elif sys.platform.startswith('darwin'):
            mode = MODE_MAC
        else:
            mode = MODE_DEFAULT

    if mode == MODE_WINDOWS:
        conv_func = to_windows
    elif mode == MODE_MAC:
        conv_func = to_mac
    else:
        conv_func = to_unix

    if out_filepath is None:
        out_filepath = filepath

    # data_1 = read_data(filepath, encoding)
    # data_2 = conv_func(data_1)
    # write_data(out_filepath, data_2, encoding)
    # if sys.version_info[0] == 3:

    # print(tempfile.tempdir)

    filepath_backup = filepath + '.bak'
    copy(filepath, filepath_backup)

    try:
        with codecs.open(filepath, 'r', encoding) as f_one:
            data2 = conv_func(f_one.read())
        with codecs.open(out_filepath, 'wb', encoding) as f_two:
            try:
                f_two.write(data2)
            except:
                f_two.write(data2.encode())
    except Exception:
        copy(filepath_backup, filepath)
        raise
    finally:
        os.remove(filepath_backup)


def to_windows(buffer):
    return re.sub(__CHANGE_REGIX, WINDOWS_LINE, buffer)


def to_mac(buffer):
    return re.sub(__CHANGE_REGIX, MAC_LINE, buffer)


def to_unix(buffer):
    return re.sub(__CHANGE_REGIX, UNIX_LINE, buffer)
