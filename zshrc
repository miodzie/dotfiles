# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh 
export LANG=en_US.UTF-8 

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export EDITOR="nvim" 
source ~/.secrets

export PATH=$PATH:/usr/local/go/bin
if [ -x "$(command -v go)" ]; then
    export GOPATHV
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi
# export PATH=$PATH:~/.local/bin
# export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$PATH:$HOME/scripts" 
# for go get stuff
export GIT_TERMINAL_PROMPT=1

if [ -d "/home/linuxbrew/.linuxbrew/bin/brew shellenv" ]; then 
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) 
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore-vcs --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.composer/vendor/bin:$PATH"
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc


if [ -d $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
    export PATH="$HOME/.cargo/bin:$PATH" 
fi


# Lazy load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
if type rbenv > /dev/null; then
    function rbenv() {
        unset -f rbenv
        eval "$(command rbenv init - --no-rehash)"
        rbenv $@
    }
fi
# Lazy load ruby too
function ruby() {
    unset -f ruby
    if [ -z ${RBENV_SHELL} ]; then eval "$(command rbenv init - --no-rehash)"; fi
    ruby $@
}

export PATH="$HOME/.npm-global/bin:$PATH"

# Lazy load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
if type pyenv > /dev/null; then
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init - --no-rehash)"
        pyenv $@
    }
fi
# Lazy load python too
function python() {
    unset -f python
    if [ -z ${PYENV_SHELL} ]; then eval "$(command pyenv init - --no-rehash)"; fi
    python $@
}

# Slows everything down, and I don't even use it
# if [ -x "$(command -v thefuck)" ]; then
    # eval $(thefuck --alias)
# fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
bindkey '^ ' autosuggest-accept # Use ctrl space for zsh autocomplete
