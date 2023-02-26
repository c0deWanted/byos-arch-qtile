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
echo "Choose theme:"
echo
echo "1. Raven night"
echo "2. Polar day"
echo
echo "----------------------------------------------------"
tput sgr0


read -r -p "Choose [1/2] :" input


cd $installed_dir/Personal

sh 900-*
sh 910-*

case $input in
      [1])
            tput setaf 6
            echo "|» Raven dark"
            cp $HOME/.config/qtile/config.py.dark $HOME/.config/qtile/config.py
            cp $HOME/Pictures/Background/017.jpg /usr/share/sddm/themes/arcolinux-simplicity/images/background.jpg
            echo "feh --bg-fill /home/oh/Pictures/Backgrounds/017.jpg &" | sudo tee $HOME/.config/qtile/scripts/autostart.sh
            ;;
      [2])
            tput setaf 6
            echo "|» Polar day"
            cp $HOME/.config/qtile/config.py.light $HOME/.config/qtile/config.py
            cp $HOME/Pictures/Background/010.jpg /usr/share/sddm/themes/arcolinux-simplicity/images/background.jpg
            echo "feh --bg-fill /home/oh/Pictures/Backgrounds/007.jpg &" | sudo tee $HOME/.config/qtile/scripts/autostart.sh
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

###############################################################################################


tput setaf 4
echo "----------------------------------------------------"
echo "     Done"
echo "----------------------------------------------------"
tput sgr0

