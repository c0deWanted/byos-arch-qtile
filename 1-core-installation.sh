#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Edited    : c0deWanted
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

################################################################################################################o #
tput setaf 6
echo "----------------------------------------------------"
echo
echo "............................::..........::...."
echo ".*NMNSSNSI..*MS:....:NN:.:SNSSNS*...:VNNSSSS:."
echo "..IMV...SM*..INS*..INS*.:SN*..:SM*..VMI......."
echo "..IMSIIVNV:...:NN*IM$:..*N$:...VMI..*NMVI**..."
echo "..IMS**ISNI:...:IMN*:...*N$:...VMI....:*IVNNI."
echo "..IMV...:SM*....:MN.....:SN*..:SM*........:MM:"
echo "..IMNVVSNS*.....:MN......*NNVVNM*...ISVVVSNS*."
echo "..::::::.........::........:**:......:***::..."
echo
echo "Arch Linux required"
echo
echo "Qtile WM "
echo "Arco Linux repos & software"
echo
echo "----------------------------------------------------"
tput sgr0

read -r -p "Proceed? [Y/n] :" input

case $input in
      [yY][eE][sS]|[yY])
            tput setaf 6
            echo "|» Boost pacman"
            echo "|» Parallel downlods -> 10"

            FIND="#ParallelDownloads = 5"
            REPLACE="ParallelDownloads = 10"
            sudo sed -i "s/$FIND/$REPLACE/g" /etc/pacman.conf

            echo "|» Candy"

            FINDCOLOR='#Color'
            REPLACECOLOR='Color\nILoveCandy'
            sudo sed -i "s/$FINDCOLOR/$REPLACECOLOR/g" /etc/pacman.conf

            tput sgr0

            sudo pacman -Sy

            sh 100-install-arco*
            sh 110-install-bluetooth*
            sh 120-install-cups*
            sh 130-install-core-software*
            sh 140-install-qtile*

            ;;
      [nN][oO]|[nN])
            tput setaf 6
            echo "|» Bye"
            tput sgr0
            exit 0
            ;;
      *)
            tput setaf 1
            echo "|» Invalid input..."
            echo "|» Quit"
            tput sgr0
            exit 1
            ;;
esac
