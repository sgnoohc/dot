#!/bin/bash

# source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc;
fi

function jv() {
  source ~/dot/mybashrc
}

function setdisplay() {
  echo $DISPLAY > ~/dot/.display
}

setdisplay

alias slide="cd ~/Google\ Drive/MySlides/2019/8August/"

#eof

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/p.chang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/p.chang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/p.chang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/p.chang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

