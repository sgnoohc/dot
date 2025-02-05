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

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/Users/phchang/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/phchang/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/phchang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/phchang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/phchang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/phchang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

