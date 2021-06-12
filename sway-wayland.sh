#!/bin/sh
#This install script installs sway WM and related tools. It uses the Wayland protocol.


#Dependencies: git, pacman, a vanilla install of Arch Linux with the base-devel package 
#Packages which will be installed: sway waybar wl-clipboard xfce4-terminal grim slurp neovim otf-font-awesome pulseaudio pulseaudio-alsa pulse
#				   audio-bluetooth bluez bluez-utils fish ttf-jetbrains-mono pango network-manager-applet ranger mate-calc 
#				   chromium dunst light ttf-ms-fonts adwaita-qt clipman
#                                  
#                                  
#                                  
#                                  
#
#You will also need my scripts as well. Remember to add ~/.local/bin to $PATH.

set -x

git clone https://github.com/kibybyte/sway
cd sway
rm -rf $(pwd)/LICENSE

for file in $(pwd)/*
do
    location=$(cat $file | head -2 | tail -1 | awk '{printf $2}')
    if [ ! -d "${location%/*}" ]
    then
        mkdir -p "${location%/*}"
    fi
    cat $file > $location
done


sudo pacman -S sway waybar wl-clipboard xfce4-terminal grim slurp neovim otf-font-awesome pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-utils fish ttf-jetbrains-mono pango network-manager-applet ranger mate-calc chromium dunst light --noconfirm

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -si

paru -S ttf-ms-fonts adwaita-qt clipman --noconfirm

chsh -s /usr/bin/fish
