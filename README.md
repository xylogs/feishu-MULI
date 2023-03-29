# feishu-MULI
这是一个用于监控linux系统用户登陆信息推送飞书机器人webhook的脚本。

# 用法
1. 检查 PAM 配置：在 Linux 系统中，PAM 配置文件通常位于 /etc/pam.d/ 目录下。可以检查 /etc/pam.d/sshd 文件中是否包含以下内容：
      session optional pam_exec.so /path/to/login_notify.sh #脚本文件路径
   如果没有这一行配置，可以手动添加。如果有这一行配置，可以检查脚本路径是否正确。

2. 检查 PAM 模块：在 Linux 系统中，PAM 模块通常位于 /lib/security/ 目录下。可以检查 /etc/ssh/sshd_config 文件中是否包含以下内容：
      UsePAM yes
   如果没有这一行配置，可以手动添加。如果有这一行配置，可以检查 PAM 模块路径是否正确。

3. 重启 SSH 服务：在修改 PAM 配置或者 PAM 模块后，需要重启 SSH 服务才能生效。可以使用以下命令重启 SSH 服务：
      systemctl restart sshd
    如果以上方法都无法解决问题，可以尝试查看系统日志，以了解登录过程中是否出现了错误。可以使用以下命令查看系统日志：
      journalctl -u sshd
