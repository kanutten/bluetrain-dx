#!/bin/bash

#Installing Microsoft Fonts

mkdir -p ~/.local/share/fonts/mscorefonts

wget https://cloud.uol.de/s/6HtRPcJZeMip7aC/download/ms-corefonts.zip -P ~/

cd ~/
unzip ms-corefonts.zip
rm ms-corefonts.zip

cp -v fonts/*.ttf fonts/*.TTF ~/.local/share/fonts/mscorefonts/

#echo "Enabling System wide, currently no Flatpak support:"
mkdir -p /usr/local/share/fonts/mscorefonts/
cp -v fonts/*.ttf fonts/*.TTF /usr/local/share/fonts/mscorefonts/
rm -rf fonts
