#!/bin/sh

# TODO add vim-plug, literally everything else

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo dnf install sl
