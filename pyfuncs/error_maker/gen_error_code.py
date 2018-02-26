# -*- coding: utf-8 -*-
"""
Created on 2014/6/18.

@author:
"""
import re
import os
from tornado.template import Template


file_path = os.path.dirname(os.path.abspath(__file__))


def open_file(path):
    u"""打开文件."""
    return open(path, encoding='utf8').read()


def open_csv(path):
    u"""打开CSV文件."""
    _lines = []
    _file = open(path, encoding='utf8')

    for line in _file.readlines():
        line = line.replace('\n', '')
        line = line.replace('\r', '')

        _line = line.split(',')
        if len(_line) == 3:
            _lines.append(_line)
    return _lines


def delete_space_line(path):
    u"""删除空白行文件."""
    new_lines = ''
    datas = open(path, 'r', encoding='utf8')

    sub_status = False
    for line in datas.readlines():
        if line.find('Array Begin') != -1:
            sub_status = True
        if line.find('Array End') != -1:
            sub_status = False

        if sub_status:
            if re.search('[0-9a-zA-Z]{1,}', line):
                new_lines += line
        else:
            new_lines += line

    datas.close()
    open(path, 'w', encoding='utf8').write(new_lines)


if __name__ == '__main__':
    error_data = open_csv(file_path + '/make_error_info.csv')
    error_jinja = open_file(file_path + '/make_error_info.jinja')

    template = Template(error_jinja)
    make_data = template.generate(**{'error_infos': error_data}).decode('utf8')
    open(file_path + '/../error_info.py', 'w', encoding='utf8').write(make_data)
    delete_space_line(file_path + '/../error_info.py')
    print('sucess')

#     open('..\school_module\error_info.py', 'w').write(make_data.encode('utf-8'))
#     delete_space_line('..\school_module\error_info.py')
