# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\j]$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w[\j]$ '

	if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\][\j]\$ '
	else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w[\j]\$ '
fi
#unset color_prompt force_color_prompt
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\][\j]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.alias ]; then
    . ~/.alias
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# change to vi-mode while editting command-line
set -o vi

# set
alias e=exit
alias jman='LANG=ja_JP.utf8 man'
alias sudo='sudo -E'
alias update='sudo updatedb && sudo apt update && sudo apt upgrade -y'
alias cd='mkcd'
alias vlsblk='lsblk --output VENDOR,MODEL,LABEL,NAME,FSTYPE,SIZE,MOUNTPOINT'
alias xcopy='xclip -in -selection clipboard'
alias watch='watch -td -n0.1'
alias dmesg='dmesg -wT'

# env-var for rogue
export ROGUEOPTS="jump,passgo,skull,askquit,name=a01,fruit=slime-mold,file=rogue.save"

# command history
HISTFILESIZE=9999999999999999999999999
HISTSIZE=9999999999999999999999999

# prompt
#function prompt() {
#PS1="\$(string='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\][\j]'
#	length=$(echo $string | wc --bytes)
#	length=$((${COLUMNS}-${length}+35))
#	bar=\"-\"
#	while [ \"$length\" -gt \"0\" ]
#	do
#	    bar=\"${bar}-\"
#	    length=$((${length}-1))
#	done
#	bar=\"${bar}$ \"
#	echo \"$bar\")"
#}
	
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\][\j]$(prompt)'

PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\[\e[36m\][\j]$(tmux has 2>/dev/null && echo `{ echo -n "("; tmux ls | wc --lines; echo -ne "\b)"; }`)\[\e[00m\]\[\e[31m\]$(length=$(echo \u@\h:\w[\j] | wc --bytes)

length=$((${length}+3))
while [ "${length}" -ge "${COLUMNS}" ]
do
	length=$((${length}-${COLUMNS}))
done
length=$((${COLUMNS}-${length}))


bar=""

while [ "$length" -ge "0" ]
do
	bar="${bar}-"
	length=$((${length}-1))
done

echo "${bar}"
)\n\[\e[00m\]\$ '


_mymake(){
	COMPREPLY=( `ls -F | grep -v / | sed 's/\..*//'` )
}
complete -F _mymake make

_myhoge(){
	COMPREPLY=( `ls -F | grep -v /` )
}
complete -F _myhoge hoge
complete -f make

function mymkdirecho {
	EXISTS=`[ -d "$@" ]; echo $?`
	mkdir -p "$@" && eval command cd "\"\$$#\"" \
		    && [ "$EXISTS" = "1" ] && echo directory "$@" has been created
}
function mkcd(){
	ARG=$@
	if [ -z "$ARG" ]; then
		command cd
	elif [ "$ARG" = "-" ]; then
		command cd -
	elif [ "${ARG:0:2}" = "--" ]; then
		mymkdirecho "${ARG:3}"
	else
		mymkdirecho "$ARG"
	fi
}


function ra {
    #tempfile="$(mktemp)"
	[ ! -f "~/.radir" ] && touch ~/.radir
    tempfile=~/.radir
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    #rm -f -- "$tempfile"
}

alias cdra='cd `cat ~/.radir`'

function mkver(){
	EXTENSION=`echo $@ | sed -r 's/.*(\.[^.]*)/\1/g'`
	BODYNAME=`echo $@ | sed -r 's/(.*)\.[^.]*/\1/g'`
	if [ $EXTENSION = $BODYNAME ]
	then
		EXTENSION=''
	fi

	ATIME=`stat $@ |
			egrep 'Access: [0-9]'`
	DATE=`echo $ATIME |
			sed -r 's/[^0-9]*([0-9]+)-([0-9]+)-([0-9]+) ([0-9]+):([0-9]+).*/\2\3/g'`
	TIME=`echo $ATIME |
			sed -r 's/[^0-9]*([0-9]+)-([0-9]+)-([0-9]+) ([0-9]+):([0-9]+).*/\4\5/g'`
	FILENAME=$BODYNAME.$DATE$EXTENSION

	if [ -e $FILENAME ]
	then
		FILENAME=$BODYNAME.$DATE$TIME$EXTENSION
	fi

	mv $@ $FILENAME
}

# Function, enhanced make
function hightmake(){
	make $@ && \
	if [ -f $@.c ]; then
		 ./$@
	fi
}
alias make=hightmake

source ~/.bashrc.local

# tmux
# sourced from: https://wiki.archlinux.org/index.php/tmux#Bash
if [[ $DISPLAY ]]; then
	# If not running interactively, do not do anything
	[[ $- != *i* ]] && return
	#[[ -z "$TMUX" ]] && exec tmux
	[[ -z "$TMUX" ]] && { tmux; [ ! -f ~/.dontdie ] && exit || rm ~/.dontdie; }
fi

function notify(){
	function enable_hisotry(){
		## Enable history
		HISTFILE=~/.bash_history
		set -o history
	}
	function post_message(){
		## Notify first argument
		curl\
			-X POST\
			-H 'Content-type: application/json'\
			--data "{'text':\"$*\"}"\
			$SLACKGENERAL
	}
	case "$1" in
		-s | --start)
			enable_hisotry
			;;
		-1 | --oneline)
			post_message `history 1 | sed -r 's/^ +[0-9]+ +(.+); notify -1/\1/g'`
			;;
		*)
			post_message `history 2 | head -n1 | sed -r 's/^ +[0-9]+ +//g'`
	esac
}
