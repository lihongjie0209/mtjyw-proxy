#!/bin/bash

# 获取服务器出口IP的脚本
# 使用多个服务来确保可靠性

get_ip() {
    # 尝试多个IP检测服务
    services=(
        "https://ipinfo.io/ip"
        "https://api.ipify.org"
        "https://checkip.amazonaws.com"
        "https://icanhazip.com"
        "https://ipecho.net/plain"
    )
    
    for service in "${services[@]}"; do
        ip=$(curl -s --connect-timeout 5 --max-time 10 "$service" 2>/dev/null | tr -d '\n\r' | grep -E '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')
        if [[ -n "$ip" ]]; then
            echo "$ip"
            return 0
        fi
    done
    
    echo "Unable to determine IP"
    return 1
}

# 获取IP并输出JSON格式
ip=$(get_ip)
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat << EOF
{
    "server_ip": "$ip",
    "timestamp": "$timestamp",
    "service": "mtjyw-proxy"
}
EOF