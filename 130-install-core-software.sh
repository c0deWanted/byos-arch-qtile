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

#echo "Deleting current /etc/pacman.d/mirrorlist and replacing with"
#echo
#echo "Server = http://mirror.rackspace.com/archlinux/\$repo/os/\$arch
#Server = https://mirror.rackspace.com/archlinux/\$repo/os/\$arch
#Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch
#Server = https://mirror.osbeck.com/archlinux/\$repo/os/\$arch
#Server = http://mirror.osbeck.com/archlinux/\$repo/os/\$arch
#Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist
# echo
# tput setaf 6
# echo "|» Arch Linux Servers have been written to /etc/pacman.d/mirrorlist"
# echo "|» Use nmirrorlist to inspect"
# tput sgr0
# echo

sudo pacman -Syy

echo
tput setaf 6
echo "|» Core software"
tput sgr0
echo


list=(
adobe-source-sans-fonts
aic94xx-firmware
alacritty
alacritty-themes
arandr
arc-gtk-theme
archiso
asciinema
avahi
awesome-terminal-fonts
base16-alacritty-git
bash-completion
bat
brave-bin
celluloid
cpuid
cpupower
curl
dconf-editor
deadbeef
dmenu
downgrade
evince
expac
exa
fd
feh
file-roller
#fish
flameshot-git
flatpak
font-manager
gimp
git
#gitahead-bin
#gitfiend
gnome-calculator
gnome-disk-utility
gparted
grub-customizer
gtop
gvfs-smb
hardcode-fixer-git
hardinfo-gtk3
hddtemp
htop
hw-probe
#intellij-idea-community-edition
inxi
kvantum
libreoffice-fresh
linux-firmware-qlogic
lshw
man-db
man-pages
mlocate
meld
midori
most
mousepad
mpv
neofetch
networkmanager
network-manager-applet
networkmanager-openvpn
nm-connection-editor
nomacs
noto-fonts
ntp
nss-mdns
numlockx
oh-my-zsh-git
openresolv
pacman-contrib
paru-bin
pavucontrol
peek
playerctl
polkit-gnome
polybar
python-pylint
python-pywal
pv
#qutebrowser
rate-mirrors-bin
remmina
ripgrep
rsync
rofi
arcolinux-rofi-themes-git
scrot
sardi-icons
sddm
simplescreenrecorder
solaar
sparklines-git
speedtest-cli-git
squashfs-tools
system-config-printer
the_platinum_searcher-bin
the_silver_searcher
thunar
thunar-archive-plugin
thunar-media-tags-plugin
time
transmission-gtk
tree
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-fira-sans
#ttf-hack
ttf-inconsolata
ttf-jetbrains-mono
#ttf-liberation
ttf-mononoki-nerd
#ttf-roboto
#ttf-roboto-mono
#ttf-ubuntu-font-family
volumeicon
wget
xcolor
xdg-user-dirs
xfce4-power-manager
xorg-xkill
yay-bin
zsh
zsh-completions
zsh-syntax-highlighting
rxvt-unicode
urxvt-fullscreen
urxvt-perls
urxvt-resize-font-git
gzip
p7zip
unace
unrar
unzip
)

count=0

for name in "${list[@]}" ; do
    count=$[count+1]
    tput setaf 6;echo "|» Installing package nr.  "$count " " $name;tput sgr0;
    func_install $name
done

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service
sudo systemctl enable cpupower.service
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service


if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  sudo pacman -S --noconfirm --needed qt5ct
fi

sudo pacman -S --noconfirm --needed jdk17-openjdk
sudo pacman -S --noconfirm --needed jdk8-openjdk

if grep -q "archlinux" /etc/os-release; then
  echo
  tput setaf 6
  echo "|» Set Java 17 as default"
  tput sgr0
  sudo archlinux-java set java-17-openjdk
fi

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

if grep -q "Arch Linux" /etc/os-release; then

  echo
  tput setaf 3
  echo "|» Getting latest /etc/nsswitch.conf from ArcoLinux"
  tput sgr0
  echo

  sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
  sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf

fi
echo
tput setaf 6
echo "|» Done"
tput sgr0
echo
