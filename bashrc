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

#eof

# added by Miniconda3 installer
#export PATH="/home/users/phchang/public_html/analysis/deepjet/miniconda3/bin:$PATH"
