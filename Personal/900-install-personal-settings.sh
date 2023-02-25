#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.arcolinux.com
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
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

echo
tput setaf 6
echo "|» Personal settings"
tput sgr0
echo
tput setaf 6
echo "|» Adding xorg xkill"
tput sgr0
echo
[ -d /etc/X11/xorg.conf.d/ ] || mkdir -p /etc/X11/xorg.conf.d/
sudo cp  settings/xorg/* /etc/X11/xorg.conf.d/

echo
tput setaf 6
echo "|» Copy configuration files"
tput sgr0
echo

cp -rf $installed_dir/settings/* $HOME/.config/

echo
tput setaf 6
echo "|» Copy home"
tput sgr0
echo

cp -rf $installed_dir/home/oh* /home/

echo
tput setaf 6
echo "|» Done"
tput sgr0
echo
