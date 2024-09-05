~#!/bin/bash

# update
sudo pacman -Syu

# core
sudo pacman -S --noconfirm vim mc git htop openssh pulseaudio pulseaudio-alsa pulseaudio-equalizer pulseaudio-jack tree 
mkdir ~/sources ~/.config
cd ~/sources
git clone https://github.com/oroszpeter97/arch-postinstall.git
cd arch-postinstall

pwd
cp -r config-files/. ~/

# yay

# desktop-enviorment


# desktop-apps
