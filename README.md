### 进入 env 环境

```shell
source ~/path/to/venv/bin/activate
# or 使用 alias
pv
```

### 运行服务

```shell
python3 manage.py runserver
```

### python 虚拟环境

#### 原因：mac 上使用以下命令安装时会遇到一些报错，原因是 brew 安装的 python 受系统管控

python3 -m pip install Django==5.0.7
error: externally-managed-environment

#### 创建虚拟环境

```shell
python3 -m venv path/to/venv
```

#### 进入虚拟环境

```shell
source ~/path/to/venv/bin/activate
```

### 退出虚拟环境

```shell
deactivate
```

### 查看 migrate 命令

```shell
python manage.py sqlmigrate polls 0001
```

### 收集静态文件

```shell
python manage.py collectstatic  # 收集全部静态文件到STATIC_URL定义的路径内

```

# 部署

### 安装 uwsgi

```shell
pip install uwsgi
```

### 配置 uwsgi

```shell
vim uwsgi.ini
```

```ini
[uwsgi]
# 指定项目路径
chdir=/Users/bytedance/code/study/pyStudy
# 指定项目的wsgi文件
module=pyStudy.wsgi
# 指定项目的虚拟环境
home=/Users/bytedance/path/to/venv
# 指定项目的静态文件路径
static-map=/static=/Users/bytedance/code/study/pyStudy/static
# 指定项目的静态文件路径
static-map=/media=/Users/bytedance/code/study/pyStudy/media
# 指定项目的静态文件路径

```

### 启动 uwsgi

```shell
uwsgi --ini uwsgi.ini
```

### 停止 uwsgi

```shell
uwsgi --stop uwsgi.pid
```

### nginx 配置

```shell
    server {
        listen 93;
        server_name localhost;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;
        location / {
            include uwsgi_params;
            uwsgi_pass 127.0.0.1:8001; #端口要和uwsgi里配置的一样
            uwsgi_param UWSGI_SCRIPT pyStudy.wsgi; #wsgi.py所在的目录名+.wsgi
            uwsgi_param UWSGI_CHDIR /Users/bytedance/code/study/pyStudy/; #项目路径

        }
        location /static/ {
            alias /Users/bytedance/code/study/pyStudy/static/; #静态资源路径
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            root html;
        }
    }
```
