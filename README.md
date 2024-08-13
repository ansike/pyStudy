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
