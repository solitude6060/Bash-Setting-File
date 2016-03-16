# .bashrc
#
# This file should contain aliases, shell variables, and functios,
# those cannot be passed to child process.
#
# Ref to .profile for details
#

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

###################################
## Standard Aliases
###################################
alias mv='mv -i'
alias cp='cp -i'
alias diff='diff -y'
alias ls='ls -FNp --color=auto --time-style=long-iso'
alias less='less -FRSXi'
alias rm=_rm
alias rrm='/bin/rm -i'

###################################
## Local functions and commands
###################################
function _rm() {
local path
for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
        local dst=${path##*/}
        # append the time if necessary
        while [ -e ~/.Trash/"$dst" ]; do
            dst="$dst "$(date +%H-%M-%S)
        done
        mv "$path" ~/.Trash/"$dst"
    fi
    echo "$path deleted." # added by myself
done
}

###################################
## Shell style
###################################
#export PS1="\u@Mac [\w] "

# shorten the full path 
export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF; else if (NF>3) print $1 "/" $2 "/.../" $NF; else print $1 "/.../" $NF; } else print $0;}'"'"')'
#PS1='$(eval "echo ${MYPS}")$ '

if [ "$PS1" ]; then
    case $TERM in
        xterm*)
        if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
        else
            #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@MacBook:${PWD/#$HOME/~}"; echo -ne "\007"'
        fi
        ;;
        screen)
        if [ -e /etc/sysconfig/bash-prompt-screen ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
        else
            #PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\033\\"'
            PROMPT_COMMAND='echo -ne "\033_${USER}@MacBook:${PWD/#$HOME/~}"; echo -ne "\033\\"'
        fi
        ;;
        *)
        [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
        ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize
    #[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
    PS1="\`if [ \$? = 0 ]; then echo \[\e[35m\]^_^\[\e[0m\]; else echo \[\e[31m\]Q_Q\[\e[0m\]; fi\`\u\e[38;05;199m@\e[0mutcs [${MYPS}] "
    #PS1="\u\e[38;05;199m@\e[0mMBP [\w] "
fi
