#!/bin/bash

clear

mkdir -p ~/.config/mpd/playlists
mkdir -p ~/.config/ncmpcpp
echo "Creando las carpetas necesarias"

cp mpd.conf ~/.config/mpd/
cp ncmpcpp.conf ~/.config/ncmpcpp/config
echo "Copiando los archivos mpd.conf y ncmpcpp.conf"

cd ~/.config/mpd/
touch {database,log,pid,state,sticker.sql}
echo "Creando los archivos necesarios"
