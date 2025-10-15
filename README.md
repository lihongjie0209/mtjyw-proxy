# Caddy Proxy for www.ctctc.cn

这是一个使用Caddy作为反向代理服务器的Docker配置，用于代理所有请求到 https://www.ctctc.cn/

## 文件说明

- `Dockerfile`: Docker镜像构建文件
- `Caddyfile`: Caddy服务器配置文件
- `docker-compose.yml`: Docker Compose部署文件
- `README.md`: 说明文档

## 使用方法

### 方法1: 使用Docker Compose（推荐）

```bash
# 启动服务
docker-compose up -d

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down
```

### 方法2: 使用Docker命令

```bash
# 构建镜像
docker build -t caddy-proxy .

# 运行容器
docker run -d --name ctctc-proxy -p 80:80 caddy-proxy

# 查看日志
docker logs -f ctctc-proxy

# 停止容器
docker stop ctctc-proxy
docker rm ctctc-proxy
```

## 配置说明

- 服务监听端口: 80
- 代理目标: https://www.ctctc.cn/
- HTTPS自动申请: 已禁用
- 日志输出: 控制台输出

## 访问方式

启动服务后，可以通过以下方式访问：

- http://localhost （如果在本地运行）
- http://your-server-ip （如果在服务器上运行）

所有请求将被代理到 https://www.ctctc.cn/

## 注意事项

1. 确保目标网站 www.ctctc.cn 可以正常访问
2. 如果需要支持HTTPS，请修改Caddyfile配置
3. 可以根据需要调整代理配置和端口映射