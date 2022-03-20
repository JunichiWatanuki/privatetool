!/bin/bash

# generate ssh-key
/usr/bin/expect -c "
set timeout 5
spawn /bin/sh

# ssh
send \"ssh-keygen -t rsa \r\"
expect -re \"Enter file in which to save the key (/home/ubuntu/.ssh/id_rsa):\"
send \"\r\"

expect -re \"Overwrite (y/n)?\"
send \"y\r\"

expect -re \"Enter passphrase (empty for no passphrase):\"
send \"\r\"

expect -re \"Enter same passphrase again:\"
send \"\r\"

expect -re \"ubuntu\"
exit 0
"
