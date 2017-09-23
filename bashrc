#!/bin/bash

# source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc;
fi

function jarvis() {
  source ~/dot/mybashrc
}

function setdisplay() {
  echo $DISPLAY > ~/login/.display
}

setdisplay

#eof
