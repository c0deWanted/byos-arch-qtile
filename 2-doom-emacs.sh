#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Editor    : c0deWanted
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

sudo pacman -S --noconfirm --needed emacs

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

###############################################################################################

cd $installed_dir/Personal

sh 920-*

tput setaf 4
echo "----------------------------------------------------"
echo "     Done"
echo "----------------------------------------------------"
tput sgr0

