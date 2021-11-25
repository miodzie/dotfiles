#!/bin/sh
rm -rf ~/.vimrc
rm -rf ~/.tmux.conf
cp ${PWD}/vimrc ~/.vimrc
cp ${PWD}/tmux.conf ~/.tmux.conf
echo "done."
