#!/bin/bash

cd $HOME
rm .bashrc; ln -s dot/bashrc .bashrc
rm .screenrc; ln -s dot/screenrc .screenrc
rm .vimrc; ln -s dot/vimrc .vimrc
rm -rf .vim; ln -s dot/vim .vim
rm .ssh/config; ln -s dot/ssh_config .ssh/config
