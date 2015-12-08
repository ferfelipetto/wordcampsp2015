#!/bin/bash

sudo -i
cd /

echo "# Alteracao de Fuso Horario (Date)"
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

echo "# Atualizacao de pacotes"
apt-get update -y

echo "# Instalacao de EasyEngine"
sudo echo -e "[user]\n\tname = dennis\n\temail = contato@seusite.me" > ~/.gitconfig
wget -qO ee rt.cx/ee && sudo bash ee

echo "# Instalacao de Servidores"
ee stack install --nginx --php --mysql --phpmyadmin --utils --postfix --wpcli --hhvm --redis

echo "# Instalacao do Composer"
cd /usr/src
curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/bin/composer

echo "# Instalacao Public Key"
mkdir ~/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1tzzR91Bbbu1nsvIXVjUiE9vtgrRv9t78swv0SMzJiawGgKRx1HdcSjSFleC3yBUXqOh/1WVWgrnjq/S3NH523rpbU4lVNJXJLDqJwy4ugeOkJbsGSiVQlp50gjClzNPYVvq9+sQjuakawAocLHLBqE14ILDFELWJod/KyHnuLTCrNf91XKNXM+6bI3VZ15GGSO4MN0Z1DSrQ/gqlrUI7rWOOlkefAHczTQAkdHbNAenz6k+2nHadlXa3t0Vyq9RCfIv+box5aa1k3Hz3PEQt5aTVLeZzn6TeicHeeYIoJzxgdpy+W+t+W9XfE/j23U/srkllMp1bqAXL54HQ/wjB dennis.sjrp@gmail.com" > ~/.ssh/authorized_keys

echo "# Restart servicos"
ee stack restart





