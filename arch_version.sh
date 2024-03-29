#!/bin/sh

cd ..
git clone https://github.com/jonaburg/picom
sudo pacman -S pkgconfig
sudo pacman -S feh dmenu rofi polybar kitty bspwm sxhkd ninja meson
sudo pacman -S libev uthash libconfig pcre libx11 libxext libxcb pixman dbus
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
cd dotfiles
cp -r .config $HOME
cp -r .local $HOME
cp .fehbg $HOME
echo "Choose theme (1 = green color scheme, 2 = adventure time color scheme) > "
read theme
if (($theme==2))
then
    cp at-theme/config $HOME/.config/polybar
    cp at-theme/kitty.conf $HOME/.config/kitty
    cp at-theme/bspwmrc $HOME/.config/bspwm
fi  
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/launch.sh
