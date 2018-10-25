# 1. pyfuncs

<!-- TOC -->

- [1. pyfuncs](#1-pyfuncs)
    - [1.1. 模块安装](#11-模块安装)
    - [1.2. 换行符转换处理（line_break_conv）](#12-换行符转换处理line_break_conv)
    - [1.3. 自动创建"__init__.py"空文件（auto_py_init_file）](#13-自动创建__init__py空文件auto_py_init_file)
    - [1.4. 简易配置生成工具](#14-简易配置生成工具)
        - [1.4.1. nginx配置生成脚本（nginx_conf_maker）](#141-nginx配置生成脚本nginx_conf_maker)
        - [1.4.2. supervisord配置生成脚本（supervisord_conf_maker）](#142-supervisord配置生成脚本supervisord_conf_maker)
        - [1.4.3. 配置生成脚本json配置文件说明](#143-配置生成脚本json配置文件说明)
    - [1.5. 外挂字幕重命名脚本（sub_rename）](#15-外挂字幕重命名脚本sub_rename)
    - [1.6. 数据库升级脚本输出（sql_upgrade）](#16-数据库升级脚本输出sql_upgrade)
    - [1.7. 数据库脚本注释移除（sql_remove_comment）](#17-数据库脚本注释移除sql_remove_comment)

<!-- /TOC -->

## 1.1. 模块安装

pip 安装

```bash
pip install git+https://github.com/ppolxda/pyfuncs
```

## 1.2. 换行符转换处理（line_break_conv）

协助处理github换行符转换问题

```bash
python -m pyfuncs.scripts.line_break_conv ./ --suffix=*.go,*.py
```

## 1.3. 自动创建"__init__.py"空文件（auto_py_init_file）

```bash
python -m pyfuncs.scripts.auto_py_init_file ./ --suffix=.git,.svn,.vscode,__pycache__
```

## 1.4. 简易配置生成工具

### 1.4.1. nginx配置生成脚本（nginx_conf_maker）

生成debug配置，只有一个ip生效

```bash
python -m pyfuncs.genconf.nginx_conf_maker --path=./tests/service_config.json --out_path=./tests/nginx.conf --debug=True
```

生成release配置，所有ip生效

```bash
python -m pyfuncs.genconf.nginx_conf_maker --path=./tests/service_config.json --out_path=./tests/nginx.conf
```

### 1.4.2. supervisord配置生成脚本（supervisord_conf_maker）

```bash
python -m pyfuncs.genconf.supervisord --path=./tests/service_config.json --out_path=./tests/nginx.conf
```

### 1.4.3. 配置生成脚本json配置文件说明

见文件./tests/service_config.json

```js
{
    // 运行模式配置，配置启动参数
    "run_mode": {
        "pipenv": "pipenv run python {progam_cwd}/{progam_name}.py {args}",
        "python": "/usr/bin/python {progam_cwd}/{progam_name}.py {args}",
        "python2": "/usr/bin/python2 {progam_cwd}/{progam_name}.py {args}",
        "python3": "/usr/bin/python3 {progam_cwd}/{progam_name}.py {args}",
        "python27": "/usr/bin/python2.7 {progam_cwd}/{progam_name}.py {args}",
        "python37": "/usr/bin/python3.7 {progam_cwd}/{progam_name}.py {args}",
        "exe": "{progam_cwd}/{progam_name} {args}"
    },
    // 运行模式配置，配置启动参数
    "nginx_servers": [
        {
            // nginx服务名称，索引下面nginx_server_name
            "server_name": "localhost",
            "listen": 10000
            // "ssl": "on",
            // "ssl_certificate": "/home/bymiao/ssl/price.pem",
            // "ssl_certificate_key": "//home/bymiao/ssl/price.key"
        }
    ],
    // 服务信息配置
    "servers": [
        {
            // 服务名称
            "service_name": "httpserver",
            // 程序名称
            "progam_name": "httpserver",
            // 程序目录
            "progam_cwd": "/home/httpserver/service1",
            // run_mode 运行模式见run_mode设置（pipenv|python|exe|python2|python3）
            "progam_run_mode": "pipenv",
            // 服务地址（static：是本地目录路径）
            "progam_addr": "localhost",
            // 服务端口
            "progam_ports": [4000, 4010],
            // 程序参数
            "progam_args": [
                "--serid=%(process_num)02d",
                "--config_file=./config/main_config.ini",
                "--listening={port_high}%(process_num)02d",
                "--logging_file=./config/logging/logging_%(process_num)02d.ini"
            ],
            // 是否启动nginx_open
            "nginx_open": true,
            // nginx虚拟地址，（tcp：TCP时输入端口）
            "nginx_uri": "/httppage",
            // nginx模式(http|websocket|tcp|static)
            "nginx_mode": "http",
            // nginx服务名称
            "nginx_server_name": "localhost"
        },
        {
            // 服务名称
            "service_name": "websocket",
            // 程序名称
            "progam_name": "websocket",
            // 程序目录
            "progam_cwd": "/home/httpserver/websocket",
            // run_mode 运行模式见run_mode设置（pipenv|python|exe|python2|python3）
            "progam_run_mode": "pipenv",
            // 服务地址（static：是本地目录路径）
            "progam_addr": "localhost",
            // 服务端口
            "progam_ports": [4100, 4110],
            // 程序参数
            "progam_args": [
                "--serid=%(process_num)02d",
                "--config_file=./config/main_config.ini",
                "--listening={port_high}%(process_num)02d",
                "--logging_file=./config/logging/logging_%(process_num)02d.ini"
            ],
            // 是否启动nginx_open
            "nginx_open": true,
            // nginx虚拟地址，（tcp：TCP时输入端口）
            "nginx_uri": "/wspage",
            // nginx模式(http|websocket|tcp|static)
            "nginx_mode": "websocket",
            // nginx服务名称
            "nginx_server_name": "localhost"
        },
        {
            // 服务名称
            "service_name": "websocket",
            // 程序名称
            "progam_name": "websocket",
            // 程序目录
            "progam_cwd": "/home/httpserver/websocket",
            // run_mode 运行模式见run_mode设置（pipenv|python|exe|python2|python3）
            "progam_run_mode": "pipenv",
            // 服务地址（static：是本地目录路径）
            "progam_addr": "localhost",
            // 服务端口
            "progam_ports": [4200, 4210],
            // 程序参数
            "progam_args": [
                "--serid=%(process_num)02d",
                "--config_file=./config/main_config.ini",
                "--listening={port_high}%(process_num)02d",
                "--logging_file=./config/logging/logging_%(process_num)02d.ini"
            ],
            // 是否启动nginx_open
            "nginx_open": true,
            // nginx虚拟地址，（tcp：TCP时输入端口）
            "nginx_uri": 4300,
            // nginx模式(http|websocket|tcp|static)
            "nginx_mode": "tcp",
            // nginx服务名称
            "nginx_server_name": "localhost"
        }
    ]
}
```

## 1.5. 外挂字幕重命名脚本（sub_rename）

外挂字幕替换成为视频名称相同格式名称

参数1 必填 视频文件名称格式 视频编号替换宏名称 {num} 如 信用欺诈师JP[01].mp4 -> 信用欺诈师JP[{num}].mp4

参数2 必填 字幕文件名称格式 字幕编号替换宏名称 {num} 如 信用欺诈师JP[01][sc].ass -> 信用欺诈师JP[{num}][sc].ass

参数3 选填 追加后缀 如输入.sc 字幕文件最后名称为  信用欺诈师JP[01].sc.ass

```bash
python -m pyfuncs.scripts.sub_rename "信用欺诈师JP.The.Confidenceman.JP.Ep{num}.Chi_Jap.HDTVrip.1280X720-ZhuixinFan.mp4" "信用欺诈师JP.Ep{num}.HD720P中日字幕.ass" ".sc"
```

## 1.6. 数据库升级脚本输出（sql_upgrade）

主要处理字段升级ADD字段需要默认值问题

升级脚本产出流程

- 通过navicat结构对比生成变更脚本（sql_upgrade_src.sql）
- 运行sql_upgrade脚本输出三个脚本（mod|add|drop）
- 脚本运行顺序 mod -> add -> drop
- 重新比较数据结构检查更新

```bash
python -m pyfuncs.scripts.sql_upgrade --input ./sql_upgrade_src.sql
```

## 1.7. 数据库脚本注释移除（sql_remove_comment）

主要处理字段升级ADD字段需要默认值问题

```bash
python -m pyfuncs.scripts.sql_remove_comment --input ./sql_upgrade_src.sql
```
