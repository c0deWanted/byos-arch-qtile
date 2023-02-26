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

#nemesis-repo added to /etc/pacman.conf

tput setaf 6
echo "|» Nemesis"

if grep -q nemesis_repo /etc/pacman.conf; then

  echo "|» nemesis_repo is already in /etc/pacman.conf"

else

  echo "|» nemesis_repo added to /etc/pacman.conf"

tput sgr0

echo '

[nemesis_repo]
SigLevel = Optional TrustedOnly
Server = https://erikdubois.github.io/$repo/$arch' | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Sy

tput setaf 6
echo "|» Installing software from nemesis_repo"

sudo pacman -S --noconfirm --needed edu-papirus-dark-tela-git
sudo pacman -S --noconfirm --needed edu-papirus-dark-tela-grey-git

tput setaf 6
echo "|» Done"


echo "|» ArcoLinux Software to install"

if grep -q arcolinux_repo /etc/pacman.conf; then

  echo "|» ArcoLinux repos are already in /etc/pacman.conf "
  else
  echo "|» Getting the keys and mirrors for ArcoLinux"
  sh arch/get-the-keys-and-repos.sh
  sudo pacman -Sy
fi


sudo pacman -S --noconfirm --needed arcolinux-hblock-git
#sudo pacman -S --noconfirm --needed arcolinux-pamac-all
sudo pacman -S --noconfirm --needed archlinux-tweak-tool-git
sudo pacman -S --noconfirm --needed sardi-ghost-flexible-colora-variations-icons-git
sudo pacman -S --noconfirm --needed surfn-plasma-dark-tela-icons-git
sudo pacman -S --noconfirm --needed vimix-cursors

sudo hblock

if [ ! -f /usr/bin/startplasma-x11 ]; then
  sudo pacman -S --noconfirm --needed archlinux-logout-git
fi

tput setaf 6
echo "|» Done"
tput sgr0
