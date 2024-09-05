~#!/bin/bash

# update
sudo pacman -Syu

while true; do
    read -p "Did you install your GPU drivers? y/n: " answer
    if [[ "$answer" == "n" ]]; then
        echo "Install them..."
        exit 0
    elif [[ "$answer" == "y" ]]; then
        break
    fi
done

# core
sudo pacman -S --noconfirm vim mc git htop openssh pulseaudio pulseaudio-alsa pulseaudio-equalizer pulseaudio-jack tree 

#git config --global user.name "p"
#git config --global user.email "github.p@proton.me"

mkdir ~/sources ~/.config
cd ~/sources
#git clone https://github.com/oroszpeter97/arch-postinstall.git
cd arch-postinstall

cp -r config-files/. ~/

# yay

# desktop-enviorment


# desktop-apps
