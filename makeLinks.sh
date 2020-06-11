#!/bin/bash
ln --backup=numbered -s `find . -maxdepth 1 -type f | grep -vE 'makeLinks.*|README.md' | xargs -n1 realpath` ~/
[ -e ~/.config/ranger/ ] || mkdir -p ~/.config/ranger/;		ln --backup=numbered -s `find ./ranger -maxdepth 1 -type f | xargs -n1 realpath` ~/.config/ranger/
[ -e ~/.w3m/ ] || mkdir -p ~/.w3m/;							ln --backup=numbered -s `realpath ./misc/keymap` ~/.w3m/
[ -e ~/.config/i3/ ] || mkdir -p ~/.config/i3/;				ln --backup=numbered -s `realpath ./misc/i3config` ~/.config/i3/config
[ -e ~/.config/i3status/ ] || mkdir -p ~/.config/i3status/;	ln --backup=numbered -s `realpath ./misc/i3statusconfig` ~/.config/i3status/config

touch ~/.bashrc.local
