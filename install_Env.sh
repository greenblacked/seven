#!/usr/bin/env bash

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

sudo apt install ubuntu-restricted-extras -y
sudo apt install libavcodec-extra -y
sudo apt install libdvd-pkg -y

sudo apt install vlc -y

sudo apt-get install flashplugin-installer pepperflashplugin-nonfree -y

sudo add-apt-repository -y ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java9-installer -y

sudo apt-get install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip -y

sudo apt-get install libreoffice -y

sudo apt-get install chromium-browser firefox -y

sudo apt-get install transmission -y

sudo apt-get install deluge -y

sudo apt-get install qbittorrent -y

sudo apt-get install ktorrent -y

sudo apt install wine -y

sudo apt install gimp -y

sudo apt install blender -y

sudo apt-get install kdenlive -y


sudo apt install shutter -y

sudo apt install scribus -y

sudo apt install gdebi -y

sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift -y

sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw -y
sudo tlp start -y


sudo add-apt-repository ppa:ubuntuhandbook1/apps
sudo apt-get update
sudo apt-get install laptop-mode-tools -y

# gksu lmt-config-gui
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-get update
sudo apt-get install elementary-tweaks -y

sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove

