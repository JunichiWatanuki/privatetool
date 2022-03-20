#!/bin/sh
date
#nohup /usr/bin/supervisord &
/usr/bin/supervisord &

ip addr show
ping -c 3 127.0.0.1
ping -c 3 192.168.0.101
ping -c 3 192.168.0.102
ping -c 3 192.168.0.103
ping -c 3 192.168.0.201

ps aux

date

ps aux
echo "host3処理終了"
