#!/bin/sh
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.vimperatorrc ~/.vimperatorrc
ln -sf ~/git/dotfiles/.bashrc ~/.bashrc
ln -sf ~/git/dotfiles/.inputrc ~/.inputrc
cp ~/git/dotfiles/.latexmkrc ~/.latexmkrc
ln -sf ~/git/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.w3m
ln -sf ~/git/dotfiles/keymap ~/.w3m/keymap
mkdir -p ~/.config/i3
ln -sf ~/git/dotfiles/config ~/.config/i3/config

touch ~/.bashrc.local
