# django+uWsgi+nginx+mysql docker-compose 部署

### 目录结构

├── README.md
├── app
│ ├── Dockerfile
│ ├── README.md
│ ├── bot
│ ├── docker-entrypoint.sh
│ ├── fifo
│ ├── logs
│ ├── manage.py
│ ├── polls
│ ├── pyStudy
│ ├── requirements.txt
│ ├── static
│ ├── target
│ ├── templates
│ └── uwsgi.ini
├── docker-compose.yml
├── mysql
│ └── init.sql
└── nginx
├── Dockerfile
├── my_nginx.conf
├── nginx-access.example_log
├── nginx.conf
└── nginx_origin.conf

### 启动

在项目的根目录下启动服务

```shell
docker-compose up -d
```

# django+uWsgi+nginx+mysql docker-compose 升级
1. 构建新版本镜像，获取版本号
```shell
# 获取当前最新的版本
docker images|grep app
# pystudy/app     1.0.2     69d001701a8b   25 minutes ago   1.12GB
# pystudy/app     1.0.1     c60131631024   26 minutes ago   1.12GB

# 修改docker-compose-build.yml 文件中的 app 版本号自增1，比如(image的tag 和 APP_VERSION)修改为1.0.3
docker-compose -f docker-compose-build.yml build 

# 生成新镜像 查看
docker images|grep app
# pystudy/app     1.0.3     fbb47457a3bb   57 seconds ago   1.12GB
# pystudy/app     1.0.2     69d001701a8b   28 minutes ago   1.12GB
# pystudy/app     1.0.1     c60131631024   29 minutes ago   1.12GB
```

2. 根据新版本号，执行升级动作
```shell
# 修改docker-compose.yml 文件中的 app 版本号为上一步生成的版本号，如：1.0.3
docker-compose stop app
docker-compose rm -f app
docker-compose up -d
docker volume prune -a -f
```

# django+uWsgi+nginx+mysql docker-compose 回滚
1. 确认回滚版本号
```shell
docker images|grep app
# pystudy/app     1.0.3     fbb47457a3bb   57 seconds ago   1.12GB
# pystudy/app     1.0.2     69d001701a8b   28 minutes ago   1.12GB
# pystudy/app     1.0.1     c60131631024   29 minutes ago   1.12GB
```

2. 根据回滚版本号，执行回滚动作
```shell
# 修改docker-compose.yml 文件中的 app 版本号为上一步获取的版本号，如：1.0.2
docker-compose stop app
docker-compose rm -f app
docker-compose up -d
docker volume prune -a -f
```