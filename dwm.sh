#!/bin/sh
set -e
grep LC_CTYPE /etc/locale.conf || echo "LC_CTYPE=en_gb.utf8" >> /etc/locale.conf
cd /tmp && git clone https://github.com/kibybyte/dwm && cd dwm && sudo make clean install
sudo pacman -S sxhkd dunst picom lxsession network-manager-applet xfce4-clipman-plugin redshift xorg-xmodmap xwallpaper ranger rofi xorg-xrdb xorg-xinput xorg-xrandr libx11 maim pipewire pipewire-alsa pipewire-pulse bluez bluez-utils fish ttf-jetbrains-mono mate-calc firefox light xfce4-terminal xclip gvfs gvfs-mtp nemo github-cli ttf-joypixels noto-fonts-emoji noto-fonts-cjk p7zip dash

clear
cd /tmp && git clone https://github.com/kibybyte/dwmrice && rm -rf dwmrice/LICENSE
for file in dwmrice/*
do
    location=$(cat $file | head -2 | tail -1 | awk '{printf $2}')
    location="$(eval "echo $location")"
    if [ ! -d "${location%/*}" ]
    then
        mkdir -p "${location%/*}"
    fi
    cp $file $location
done

mkdir -p ~/.local && git clone https://github.com/bin ~/.local/bin

paru --version || { git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && makepkg -sric; }
paru -S ttf-ms-fonts adwaita-qt clipman motivate 

clear
chsh -s /usr/bin/fish
[ $(readlink -nf /bin/sh) != /usr/bin/dash ] && sudo ln -sf /usr/bin/dash /bin/sh
sudo usermod -aG video $USER

clear
mkdir -p "$HOME"/pics/ss "$HOME"/docs "$HOME"/down "$HOME"/vids "$HOME"/music
cd "$HOME"/pics
git clone https://github.com/kibybyte/wallpapers

clear
echo "Adding vim-plug and plugins" && sleep 3
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/plugged
sudo pacman -S python-pynvim

