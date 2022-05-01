#!/bin/bash 
cd /
apt update
apt install -y python3-certbot-nginx certbot nginx cockpit ufw git curl
sudo sh -c "echo deb https://mega.nz/linux/MEGAsync/xUbuntu_$((lsb_release -a 2> /dev/null)|grep Release | awk '{print $2}')/ ./ >> /etc/apt/sources.list"
curl -fsSL https://mega.nz/keys/MEGA_signing.key | sudo apt-key add -
apt update
apt install -y megacmd
ufw enable
ufw default deny
ufw limit 22
ufw allow 1022
ufw allow 80
ufw allow 443
ufw status
rm /etc/ssh/sshd_config 
wget https://raw.githubusercontent.com/nauzome/nauzome_host/main/src/sshd_config
mv sshd_config /etc/ssh/sshd_config
systemctl restart ssh
systemctl enable ufw
wget https://raw.githubusercontent.com/nauzome/nauzome_host/main/src/systemctl.conf
mv systemctl.conf /etc/nginx/conf.d/systemctl.conf
echo "systemctlのアドレスを入力。"
read var1
sed -e 's/systemctl-misskey1.nauzome.org;/$var1/' /etc/nginx/conf.d/systemctl.conf
systemctl restart nginx
