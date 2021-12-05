#!/bin/sh
rm -rf ~/.vimrc
cp ${PWD}/vimrc ~/.vimrc

rm -rf ~/.tmux.conf
cp ${PWD}/tmux.conf ~/.tmux.conf

rm -rf ~/.vim
cp -r ${PWD}/vim/ ~/.vim

rm -rf ~/.profile
cp -r ${PWD}/profile ~/.profile

echo "done."
