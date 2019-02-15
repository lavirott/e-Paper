#!/bin/bash

# https://www.waveshare.com/wiki/2.7inch_e-Paper_HAT

INST_DIR=~/e-Paper
mkdir $INST_DIR
cd $INST_DIR

# Install BCM2835 library

wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.58.tar.gz
tar zxvf bcm2835-1.58.tar.gz
cd bcm2835-1.58
./configure
make
sudo make check
sudo make install
cd ..

# Install Wiring Pi

sudo apt-get install git
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
cd ..

# Install Python 2 library

sudo apt-get install python-pip python-imaging
sudo pip install spidev 
sudo pip install RPi.GPIO

# Install python3 library
sudo apt-get install python3-pip python-imaging
sudo pip3 install spidev 
sudo pip3 install Rpi.GPIO 
sudo pip3 install Pillow

# Install EPaper sample code
sudo apt-get install p7zip
wget https://www.waveshare.com/w/upload/f/f5/2.13inch_e-Paper_HAT-code.7z

CODE_DIR=$INST_DIR/sample_code

mkdir $CODE_DIR
cd $CODE_DIR
7zr x ../2.13inch_e-Paper_HAT-code.7z
cd ..
sudo apt-get install ttf-mscorefonts-installer fonts-wqy-microhei

# Tests bcm2835
cd $CODE_DIR/RaspberryPi/bcm2835
make
sudo ./epd

# Test wiringPi
cd $CODE_DIR/RaspberryPi/wiringpi
make
sudo ./epd

echo "Becareful, Python sample codes break display (don't enter in sleep mode)"
echo "MUST modify samples before launching them"

# # Test Python 2
# cd $CODE_DIR/RaspberryPi/python2
# sudo python main.py

# # Test Python 3
# cd $CODE_DIR/RaspberryPi/python3
# sudo python3 main.py