#!/bin/bash

echo ""
echo "My Command Line Installer"
echo ""

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

# Create destination folder
DESTINATION="./"
mkdir -p ${DESTINATION}

# Find __ARCHIVE__ maker, read archive content and decompress it
ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
tail -n+${ARCHIVE} "${0}" | tar -xvz
rm DummyContent.txt

# Put your logic here (if you need)

fold -s -w `tput cols` LICENSE.txt | more

echo ""
 accepted=0

 while true; do

    while read -r -t 0; do read -r; done

    echo ""
    read -p "Do you accept this license agreement?[Y/N]: " yno
    case $yno in
        [yY]* ) accepted=1; break;;
        [nN]* ) accepted=0; break;;
        * ) echo 'Please answer yes or no.';;
    esac
 done



  if [ $accepted == 1 ]
 then
    ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
    tail -n+${ARCHIVE} "${0}" | tar -xvz
    echo "====================================================================== "
    echo -e "${GREEN}"
    echo "Installation complete"
    echo -e "${NC}"
 else
    echo "====================================================================== "
    echo -e "${RED}"
    echo " By not accpeting this  License you won't be able   "
    echo " the license to be able to proceed                                     "
    echo -e "${NC}"
    echo "====================================================================== "
    rm  DummyContent.txt
    rm  LICENSE.txt
    exit 0
 fi


# Exit from the script with success (0)
exit 0

__ARCHIVE__
