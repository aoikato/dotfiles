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
ln -sf ~/git/dotfiles/i3config ~/.config/i3/config
mkdir -p ~/.config/i3status
ln -sf ~/git/dotfiles/i3status_config ~/.config/i3status/config
mkdir -p ~/.config/ranger
ln -sf ~/git/dotfiles/ranger/commands.py ~/.config/ranger/commands.py
ln -sf ~/git/dotfiles/ranger/commands_full.py ~/.config/ranger/commands_full.py
ln -sf ~/git/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/git/dotfiles/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/git/dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

touch ~/.bashrc.local
