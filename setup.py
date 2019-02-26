# -*- coding: utf-8 -*-
u"""
@create: 2017-02-20 13:50:54.

@author: pyfuncs

@desc: pyfuncs
"""
from setuptools import setup, find_packages

setup(
    # 包名称
    name="pyfuncs",
    # 接口包版本号
    version="0.0.22",
    # 依赖的外部模块
    install_requires=[
        # 'tornado>=4.4.1',
        # 'PyMySQL>=0.7.9',
        # 'Tornado-MySQL>=0.5.1',
        # 'pyOpenSSL>=16.0.0',
        # 'redis>=2.10.5',
        # 'pyCrypto>=2.6.1',
        # 'xmltodict>=2.6.1',
    ],
    # 查找改包文件内容（find_packages() 递归找文件）
    # 目前默认设置支持打包所有带__init__.py 文件的文件夹
    packages=find_packages(),  # 包含所有src中的包
    # 告诉distutils包都在src下
    # package_dir = {'':'src'},

    # 包文件过滤规则
    package_data={
        '': ['*.*']
    },
    # include_package_data = True,
    # 注册PyPI相关描述信息，可以不设置
    author="",
    author_email="",
    description="",
    license="",
    keywords="pyfuncs examples",
    # url="http://example.com/HelloWorld/",
)
