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


# source /Users/phchang/miniconda3/etc/profile.d/conda.sh
# export SPACK_INSTALL_DIR=/Users/phchang/Software
# source ${SPACK_INSTALL_DIR}/spack/share/spack/setup-env.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/cmsuf/data/store/user/phchang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/cmsuf/data/store/user/phchang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/cmsuf/data/store/user/phchang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/cmsuf/data/store/user/phchang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/home/p.chang/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# lori — daily briefing on login
# ~/bin/lori --short

export PATH="/home/p.chang/.pixi/bin:$PATH"
