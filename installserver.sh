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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTi7SMenzj3tVEj9pBb/hx3YGbRc/9FNS8cQRuV/EWit2vEru/DETnkZRXUjuNbk77d3wJKBOFPoU6MEkztP2+hcZUhtrPih0toU456pB0YxCkradr+RzcNToEQXEgH+zudaEgYM2R0J61iuPPVdfU4qf5hdUCdaZDZX1OAGBfsF5NYS7NCz2HzjazLHbTdV+mS3fMN/jepzulbzyIzMgzIBBkRs8qs/NrxxPptH1/ZrXqzyOl11KrkTH3QGpuXaIr9MjJoMO20ZjpusodEfhikPSWzM6Ng/wl60BXGwsyc2CLtqm2wHBHA4KiKV0+3k9zrtQKepD1GYtX6PuXnvX6nL3cTrNvwWbHtCc4QlQ2VwmZFX+Sx2SIoquMzhpD25GtcJfgVberUw3LGOLY894r50xB9YXDF2zaWtZcQqRbH/ICfpJRF8sgiGG/o2P6PifhsXBgJ0lmf8NUvxG2oGc/NwRD96MJUMmxobwILiSPnGJa7AIc12pU5573K2NSbxRr7UB2DFs1SSZvn2SHMs3UwX1RTPNGwdzAr5FU/bhrjf4DFwJ1JYDUl3f7Ru/K2s8psGcLCpvlyDbt/X6SS8lXNE6Bn/V/KVj359L6/BEycXd2tzYc/hx3m2Pk27NbB8YHHCOLzc9aHQcPMdB1hsCMCerdslRKxvzltLaO6o+zyw== fernandofelipetto@gmail.com" > ~/.ssh/authorized_keys

echo "# Restart servicos"
ee stack restart
