#!/bin/sh
date
#nohup /usr/bin/supervisord &
/usr/bin/supervisord &

ip addr show
ping -c 3 127.0.0.1
ping -c 3 192.168.10.101
ping -c 3 192.168.10.102
ping -c 3 192.168.10.103
ping -c 3 192.168.20.201

ps aux

date

ps aux
echo "host1処理終了"
