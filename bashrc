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


source /Users/phchang/miniconda3/etc/profile.d/conda.sh
export SPACK_INSTALL_DIR=/Users/phchang/Software
source ${SPACK_INSTALL_DIR}/spack/share/spack/setup-env.sh
