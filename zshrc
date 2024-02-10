# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME='eastwood' # eastwood, amuse, bureau
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh 
export LANG=en_US.UTF-8 
export PATH="$PATH:$HOME/.bin"

bindkey '^ ' autosuggest-accept # Use ctrl space for zsh autocomplete
fpath+=${ZDOTDIR:-~}/.zsh_functions

[ -f ~/.aliases ]; source ~/.aliases;
source ~/.secrets
export EDITOR="nvim" 
export PATH="$PATH:$HOME/scripts" 

export LESS=-Rj.5

export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore-vcs --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# FZF mappings and options
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
export PATH=$PATH:/usr/local/go/bin
if [ -x "$(command -v go)" ]; then
    export GOPATHV
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
    export GIT_TERMINAL_PROMPT=1 # for go get stuff
fi

# Composer + PHP
export PATH="$HOME/.composer/vendor/bin:$PATH"
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# Cargo + Rust
if [ -d $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
    export PATH="$HOME/.cargo/bin:$PATH" 
fi

# rbenv + Ruby
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
    # if rbenv wasn't loaded yet, load it.
    if [[ $(type ruby) == *"function"* ]]; then
      rbenv > /dev/null 2>&1
    fi
    unset -f ruby
    if [ -z ${RBENV_SHELL} ]; then eval "$(command rbenv init - --no-rehash)"; fi
    ruby $@
}

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


# Lazy load nvm, npm
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# function nvm() {
#     unset -f nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#     nvm $@
# }
# function npm() {
#     unset -f npm
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#     npm $@
# }
# function yarn() {
#     unset -f yarn
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#     yarn $@
# }

# load exploits
# export PATH="$HOME/.npm-global/bin:$PATH"

# IBus stuff
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

export TERM_ITALICS=true
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export CONTAINER_DIR=/Projects
export SOURCE_DIR=/Users/dean/Projects
