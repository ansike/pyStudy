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

### 推出虚拟环境

```shell
deactivate
```

### 查看 migrate 命令

```shell
python manage.py sqlmigrate polls 0001
```
