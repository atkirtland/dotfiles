#!/usr/bin/env sh

mkdir -p /media/atkirtland/Backup/home/
sudo rsync -avhH --delete --info=progress2 --info=name0 /home/ /media/atkirtland/Backup/home/

mkdir -p /media/atkirtland/Backup/opt/
sudo rsync -avhH --delete --info=progress2 --info=name0 /opt/ /media/atkirtland/Backup/opt/

mkdir -p /media/atkirtland/Backup/etc/
sudo rsync -avhH --delete --info=progress2 --info=name0 /etc/ /media/atkirtland/Backup/etc/
