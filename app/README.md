# 依赖安装

### mysql

```shell
# 启动docker服务
docker run -p 3307:3306 --name=mysql-3307 -e MYSQL_ROOT_PASSWORD=123456 -v ~/data/mysql/3307:/var/lib/mysql -d mysql:8
# 连接数据库
mysql -uroot -h127.0.0.1 -p123456 -P3307
```

### 执行数据插入操作

```sql
CREATE DATABASE `pystudy` IF NOT EXISTS DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'pystudy'@'%' IF NOT EXISTS IDENTIFIED BY 'pystudy@2024!';
GRANT ALL ON pystudy.* TO 'pystudy'@'%';
FLUSH PRIVILEGES;
```

### 安装 py module

```shell
pip3 freeze > requirements.txt
pip3 install -r requirements.txt
```

# 开发

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

### admin 账号

```shell
# 创建超管帐号
python3 manage.py createsuperuser
# pystudy/pystudyPassword@123
```

### 打包 docker 镜像

```shell
docker build -f Dockerfile . -t ansike/pystudy:latest
```
