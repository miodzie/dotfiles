#!/bin/sh
echo -e "--Make sure you are running this from the repo path--\n\n"
read -p "This will override your config files [Y/n]" -n 1 -r
echo    # move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
    BASE="$(cd "$(dirname "$0")" && pwd)"
    # All dotfiles
    for file in `find ${BASE} -maxdepth 1 -not -name '.*' -not -name install.sh -not -name bin -not -name tasks -not -name etc -not -name README.md -not -name LICENSE -type f`; do
      filename=`basename "$file"`
      echo "ln -sf $BASE/$filename -> ~/.$filename"
      ln -sf "$BASE/$filename" ~/.$filename
    done

    # Neovim
    rm -rf ~/.config/nvim
    ln -s ${PWD}/config/nvim ~/.config/nvim

    # Scripts
    rm -rf ~/scripts
    ln -s ${PWD}/scripts ~/scripts

    # neofetch
    rm -rf ~/.config/neofetch
    ln -s ${PWD}/config/neofetch ~/.config/neofetch

    # sway
    rm -rf ~/.config/sway
    ln -s ${PWD}/config/sway ~/.config/sway

    # swaylock
    rm -rf ~/.config/swaylock
    ln -s ${PWD}/config/swaylock ~/.config/swaylock

    # waybar
    rm -rf ~/.config/waybar
    ln -s ${PWD}/config/waybar ~/.config/waybar

    # vim
    rm -rf ~/.vim
    ln -s ${PWD}/vim ~/.vim

    # hammerspoon
    rm -rf ~/.hammerspoon
    ln -s ${PWD}/hammerspoon ~/.hammerspoon

    # ctags.d
    rm -rf ~/.ctags.d
    ln -s ${PWD}/ctags.d ~/.ctags.d

    touch ~/.secrets
    touch ~/.vimrc_specific
    echo "Puts secrets in ~/.secrets"
    echo "Put .vimrc machine specific settings in .vimrc_specific"
fi


mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
