# feishu-MULI
这是一个用于监控linux系统用户登陆信息推送飞书机器人webhook的脚本。

# 用法
1. 检查 PAM 配置：在 Linux 系统中，PAM 配置文件通常位于 /etc/pam.d/ 目录下。可以检查 /etc/pam.d/sshd 文件中是否包含以下内容：
  session optional pam_exec.so /path/to/login_notify.sh #脚本文件路径
