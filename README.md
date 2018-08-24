# pyfuncs

## 模块安装

pip 安装

```bash
pip install git+https://github.com/ppolxda/pyfuncs
```

## line_break_conv 换行符转换处理

协助处理github换行符转换问题

```bash
python -m pyfuncs.scripts.line_break_conv ./ --suffix=*.go,*.py
```

## auto_py_init_file 自动创建"__init__.py"空文件

```bash
python -m pyfuncs.scripts.auto_py_init_file ./ --suffix=.git,.svn,.vscode,__pycache__
```

## 简易配置生成工具

### 脚本json配置文件说明，见文件./tests/service_config.json

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
            // 服务地址
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
            // nginx虚拟地址，TCP时输入端口
            "nginx_uri": "/httppage",
            // nginx模式（http|websocket|tcp）
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
            // 服务地址
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
            // nginx虚拟地址，TCP时输入端口
            "nginx_uri": "/wspage",
            // nginx模式（http|websocket|tcp）
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
            // 服务地址
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
            // nginx虚拟地址，TCP时输入端口
            "nginx_uri": 4300,
            // nginx模式（http|websocket|tcp）
            "nginx_mode": "tcp",
            // nginx服务名称
            "nginx_server_name": "localhost"
        }
    ]
}
```

### nginx_conf_maker nginx配置生成脚本

#### 生成debug配置，只有一个ip生效

```bash
python -m pyfuncs.genconf.nginx_conf_maker --path=./tests/service_config.json --out_path=./tests/nginx.conf --debug=True
```

#### 生成release配置，所有ip生效

```bash
python -m pyfuncs.genconf.nginx_conf_maker --path=./tests/service_config.json --out_path=./tests/nginx.conf
python -m pyfuncs.genconf.nginx_conf_maker --path=./tests/service_config.json --out_path=./tests/nginx.conf --debug=True
```

### supervisord_conf_maker supervisord配置生成脚本

```bash
python -m pyfuncs.genconf.supervisord --path=./tests/service_config.json --out_path=./tests/nginx.conf
```
