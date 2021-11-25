#!/bin/sh
rm -rf ~/.vimrc
rm -rf ~/.tmux.conf
cp ${PWD}/dotfiles/vimrc ~/.vimrc
cp ${PWD}/dotfiles/tmux.conf ~/.tmux.conf
echo "done."
