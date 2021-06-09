#!/bin/sh
#This install script installs i3 WM and related tools. It uses the Xorg protocol.


#Dependencies: git, pacman, a vanilla install of Arch Linux with the base-devel package 
#Packages which will be installed: xorg-xserver, i3-gaps, i3blocks, paru-bin, maim, pulseaudio,
#                                  pulseaudio-alsa, pulseaudio-bluetooth, bluez, bluez-utils,
#                                  fish (will be set to be default shell), ttf-jetbrains-mono,
#                                  pango, nm-applet, st, dmenu, ranger, mate-calc, chromium, 
#                                  clipmenu, dunst, redshift, feh, light
#
#You will also need my scripts as well. Remember to add ~/.local/bin to $PATH.


git clone https://github.com/kibybyte/i3-xorg
cd i3-xorg
rm -rf LICENSE

for file in $(pwd)/*
do
    location=$(cat $file | head -2 | tail -1 | awk '{printf $2}')
    mkdir -p $location
    cat $file > $location
done


sudo pacman -S xorg-xserver i3-gaps i3blocks paru-bin maim pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-utils fish ttf-jetbrains-mono pango nm-applet st dmenu ranger mate-calc chromium dunst redshift feh light --noconfirm

paru -S clipmenu --noconfirm
