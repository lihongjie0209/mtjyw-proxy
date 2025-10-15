# 使用官方Caddy镜像作为基础镜像
FROM caddy:2.7-alpine

# 设置工作目录
WORKDIR /etc/caddy

# 复制Caddyfile配置文件
COPY Caddyfile /etc/caddy/Caddyfile

# 暴露80端口（不需要443端口，因为不启用HTTPS自动申请）
EXPOSE 80

# 启动Caddy服务
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]