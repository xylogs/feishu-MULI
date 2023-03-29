#!/bin/bash
hostname=$(hostname)
usetty=$PAM_TTY
WEBHOOK_URL=https://open.feishu.cn/open-apis/bot/v2/hook/#机器人webhook
username=$PAM_USER
ip_address=$(echo $PAM_RHOST | awk -F/ '{print $1}')

if [ "$PAM_TYPE" = "open_session" ]; then
    login_time=$(date)
    msg_type="text"
    content="用户 $username 登录系统:$hostname ($(curl ip.me))，IP地址为:$ip_address，登录时间为:$login_time，协议:$usetty"
fi
if [ "$PAM_TYPE" = "close_session" ]; then
    msg_type="text"
    content="用户 $username 登出系统:$hostname ($(curl ip.me))，IP地址为:$ip_address，登出时间为:$(date)，协议:$usetty"
fi

json_data="{\"msg_type\":\"$msg_type\",\"content\":{\"text\":\"$content\"}}"

curl -X POST -H "Content-Type: application/json" -d "$json_data" "$WEBHOOK_URL"

if [ "$PAM_TYPE" = "open_session" ]; then
    echo "$(date) - 用户 $username 登录系统，IP地址为 $ip_address" >> /var/log/login_notify.log
fi

exit 0
