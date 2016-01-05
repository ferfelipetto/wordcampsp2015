#!/bin/bash

sudo -i
cd /

echo "# Alteracao de Fuso Horario (Date)"
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

echo "# Atualizacao de pacotes"
apt-get update -y

echo "# Instalacao de EasyEngine"
sudo echo -e "[user]\n\tname = felipetto\n\temail = fernandofelipetto@gmail.com" > ~/.gitconfig
wget -qO ee rt.cx/ee && sudo bash ee

echo "# Instalacao de Servidores"
ee stack install --nginx --php --mysql --phpmyadmin --utils --postfix --wpcli --hhvm --redis

echo "# Instalacao do Composer"
cd /usr/src
curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/bin/composer

echo "# Instalacao Public Key"
mkdir ~/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqeewmmvyQodtzHSlz8ivf3UhCisWtvgpyoLbDxinB6kZz5PD0ymJOsi30TemkYJbY8r465o0iYFarwUXPZNF4AetRULmV+Fys7+USdusbHZsoL/YUjp3x8mpBXXrqoylV6wtwH+aCtGYn52lgQpcwGmbNbkRVmzLrBJ5PJ5f26DP6+ffHVGS+rO5tytlM7wf0S4DEsb2mBrzV/8Ww9l5G/3SCNlaNfwDH3Jn/iSKWErz/wCM8nRKi08NayJ9O0xxIcgY4MsWLOCCHJvnDmg6RKsiX0Jk5+R8Za8aINqIhwAbLfOGz5cahbjfXgVUK3HERXfS++GaK2TsO4BDQ/x+GhASnISBe1MfiZLhGI/E2RuDaZkFeT+xjcBUvXB2hTsRlde/yQyIUkXN8IFgeXgUTQM1KLDLpCbl8uC4tG5n10EzTM4h4gcEBDyU2ehULcDq9hM3VnIGkZehPQKxsFYqqbDbC2p+YTuN0LR4lUE9sjTY8K9u9RyP33BSoEG6xmkmCkm/zdDwujwojTWynZooeJ7NK34wUUt+qZnFjLmPDrRUOsh/GCAAcyS2GAF/gmh07/tnMz//Xj29E644UPb1BlcbvkU7t3W+xVhmmkJkNsjtK+ox5JRnxJ5H2FLMwqoUGM2E50bR2HhKB2mCpcNlMtZrW38C+kO+YQyI3+FC0sw== fernandofelipetto@gmail.com
" > ~/.ssh/authorized_keys

echo "# Restart servicos"
ee stack restart
