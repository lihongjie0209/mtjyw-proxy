# 使用官方Caddy镜像作为基础镜像
FROM caddy:2.7-alpine

# 安装bash和curl（Alpine默认使用ash，需要安装bash）
RUN apk add --no-cache bash curl

# 设置工作目录
WORKDIR /etc/caddy

# 复制配置文件和脚本
COPY Caddyfile /etc/caddy/Caddyfile
COPY get-server-ip.sh /etc/caddy/get-server-ip.sh

# 设置脚本执行权限
RUN chmod +x /etc/caddy/get-server-ip.sh

# 暴露80端口（不需要443端口，因为不启用HTTPS自动申请）
EXPOSE 80

# 启动Caddy服务
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]