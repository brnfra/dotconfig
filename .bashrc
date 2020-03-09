# Arquivo:.bashrc
# Autor: Bruno Franco
# Ultima_modificacao:Fri 06 Mar 2020 08:16:04 PM -03
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups
#HISTCONTROL=erasedups

# append to the history file, don't overwrite it
#shopt -s histappend
shopt -s autocd

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
#colors ALIASES1BACKGROUND=" \e[40mBlack"NORMAL="\e[41mRed"
RESET="\[\017\]"
SEP=""
BEGIN=""
NORMAL="\[\033[0m\]"
BACKNORMAL="\[\033[01;39m\]"
#BOLD
BACKPURPLE="\[\033[01;45m\]"
PURPLE="\[\033[03;35m\]"

BACKBLUE="\[\033[01;44m\]"
BLUE="\[\033[03;34m\]"

BACKGREEN="\[\033[01;42m\]"
GREEN="\[\033[03;32m\]"

BACKRED="\[\033[01;41m\]"
RED="\[\033[03;31m\]"
#ITALIC
WHITE="\[\033[03;37m\]"
BACKBLACK="\[\033[01;40m]\]"
BLACK="\[\033[03;30m\]\]"
DEFAULT="\[\033[03;96m\]\]"

BACKORANGE="\[\033[01;43m\]"
ORANGE="\[\033[33m\]"

SMILEY="${WHITE}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
TIME="\D{%d/%m/%Y  %H:%M:%S}"
HISTORY="h-\!"
LOCATION="\w"
BRANCH='$(git_branch)'

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1="${debian_chroot:+($debian_chroot)}\[\033[01;37m\]( \033[00m\]\[\033[01;33m\]\D{%d/%m/%Y  %H:%M:%S}\033[00m\]\[\033[01;34m\]|h-\!|\033[00m\]\[\033[01;37m\]\w )\n\$\033[00m\] "
    #PS1="${debian_chroot:+($debian_chroot)}\e[40m\[\033[01;37m\]( \[\033[01;33m\]\D{%d/%m/%Y  %H:%M:%S}\[\033[01;34m\]|h-\!|\[\033[01;37m\]\w )\n\033[00m\]\$\e[0m "
    PS1=$RESET$BACKPURPLE$BLACK$SEP$WHITE$TIME$NORMAL$PURPLE$SEP$BACKBLUE$BLACK$SEP$WHITE$HISTORY$NORMAL$BLUE$SEP$BACKORANGE$BLACK$SEP$WHITE$LOCATION$NORMAL$ORANGE$SEP$BACKGREEN$BLACK$SEP$BRANCH$NORMAL$GREEN$SEP$NORMAL"\n\$ "
                                                                                                                                                              
    
    #SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"
    # Throw it all together 
    #PS1="${RESET}${YELLOW}\h${NORMAL} \`${SELECT}\` ${YELLOW}>${NORMAL} "

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
alias la='ls -lah --color=auto'
alias lc='ls -CF --color=auto'
alias ll='ls -a1h --color=auto'
#alias to nav directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias CD='cd'
#Command aliases
alias svim='sudo vim'
alias cd..="cd .."
alias cim="vim"
alias VIM="vim"
alias grep="grep --color=auto"
alias EXIT="exit"
alias myhost='ssh -T user@my.remote.host screen -dAr'
#git
alias gstatus='git status'
alias gadd='git add '
alias gcommit='git commit -m '
alias gpush='git push -u origin master'
alias gpull='git pull'
alias guser='git config --global user.name '
alias gemail='git config --global user.email '
alias gconfig='git config --list --show-origin'
#docker
alias dstop='docker stop'
alias dup='docker-compose up'
alias dexec='docker exec -ti'
alias conls='docker container ls -a'
alias imgls='docker image ls'
alias dstop='docker stop deb-mariadb && docker stop deb-php-apache && docker stop deb-php-phpmyadmin'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Extract archives 
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Locale and editor
export EDITOR=VIM
export BROWSER="firefox '%s' &"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
