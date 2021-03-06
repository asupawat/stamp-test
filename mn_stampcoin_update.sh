#!/bin/bash

################################################################################
# Author:   Supawat A
# Date:     August, 16th 2018
# 
# Program:
#
#   Update STAMP Coin for single masternode
################################################################################

echo && echo 
echo "****************************************************************************"
echo "*                                                                          *"
echo "*  This script will updaten latest version of STAMP Coin for masternode.   *"
echo "*                                                                          *"
echo "****************************************************************************"
echo && echo

cd ~
sudo rm ./stamp.tar.gz 
sudo rm -rf ./stamp

sudo wget https://github.com/asupawat/stamp-test/releases/download/v1/stamp.tar.gz
sudo tar -xzvf stamp.tar.gz

sudo systemctl stop stampcoin
sleep 10

sudo cp ./stamp/stamp* /usr/local/bin/
sudo rm ./stamp.tar.gz 
sudo rm -rf ./stamp

sudo systemctl start stampcoin
sleep 10
INFO=`sudo -H -u stampcoin /usr/local/bin/stamp-cli getinfo`

echo " "
echo " "
echo "==============================="
echo "STAMP Coin Masternode updated! "
echo "==============================="
echo "${INFO}"

exit 0
