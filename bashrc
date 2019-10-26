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
