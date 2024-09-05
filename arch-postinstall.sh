#!/bin/bash

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
sudo pacman -S --noconfirm vim mc git htop openssh tree xorg awesome pulseaudio pulseaudio-alsa pulseaudio-equalizer pulseaudio-jack pamixer feh alacritty flameshot mpv qbittorrent picom 

mkdir ~/sources ~/.config
cd ~/sources
git clone https://github.com/oroszpeter97/arch-postinstall.git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sirc

cp -r ~/sources/arch-postinstall/config-files/. ~/
git config --global user.name "p"
git config --global user.email "github.p@proton.me"
