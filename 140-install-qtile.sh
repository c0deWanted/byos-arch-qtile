#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 6
        echo "|» The package "$1" is already installed"
        echo
        tput sgr0
    else
        tput setaf 6
        echo "|» Installing package "  $1
        echo
        tput sgr0
        sudo pacman -S --noconfirm --needed $1
    fi
}

echo
tput setaf 6
echo "|» Install qtile"
tput sgr0
echo


list=(
lxappearance
picom
qtile
rofi-theme-fonts
sxhkd
volumeicon
)

count=0

for name in "${list[@]}" ; do
    count=$[count+1]
    tput setaf 6;echo "|» Installing package nr.  "$count " " $name;tput sgr0;
    func_install $name
done

yay -S --noconfirm --needed qtile-extras

cp -rf $installed_dir/Personal/settings/qtile* $HOME/.config/
cp -rf $installed_dir/Personal/settings/sxhkd* $HOME/.config/

echo
tput setaf 6
echo "|» Done"
tput sgr0
echo
