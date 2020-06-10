#!/bin/bash
inst(){
    SRC=`realpath $1`
    if [ -z "$2" ];then
		DST="$HOME/"`basename $1`
	elif [ -n "`echo $2 | grep -E '.*/$'`" ]; then
		DST=$2`basename $1`
		mkdir -p $2
	else
		DST=$2
		mkdir -p `dirname $2`
	fi

    #if [ -e $DST ];then
    #    mv $DST $DST.old
    #fi
	ln --backup=numbered -s $SRC $DST
}
export -f inst

find . -maxdepth 1 -type f | grep -vE 'makeLinks.*|README.md' | xargs -n1 -d'\n' bash -c 'inst "$@"' _
find ./ranger -maxdepth 1 -type f | xargs -n1 -d'\n' bash -c 'inst "$@" ~/.config/ranger/' _
inst ~/git/dotfiles/misc/keymap ~/.w3m/
inst ~/git/dotfiles/misc/i3config ~/.config/i3/config
inst ~/git/dotfiles/misc/i3statusconfig ~/.config/i3status/config

touch ~/.bashrc.local

#inst srcf
#inst srcf dstd
#isnt srcf dstd
#isnt srcf dstf
