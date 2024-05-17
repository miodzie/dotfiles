# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#--# My config
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

bindkey -e # emacs keybind mode -- useful
# search previous commands similar to what's currently in the prompt -- e.g. $ curl | <C-p>
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

export EDITOR='nvim'
export PAGER='most'
alias ls='ls --color'
alias l='ls -lvAhF --group-directories-first'
# TODO: Review add other ls aliases.
alias lm="l | more"
alias c='clear'
alias reload='clear && exec $SHELL'
alias sudo="sudo " # allow aliases to be sudo'd
alias ..='cd ..'

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# TODO: fork 
# autoload -U compinit; compinit
# zinit light Aloxaf/fzf-tab
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::docker-compose
# todo check out these below 
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions (required for fzf-tab..)
autoload -Uz compinit && compinit

zinit cdreplay -q

HISTSIZE=5000
HISTFILE=~/.zsh_history # this is the default....
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion style -- TODO: NOT WORKING!
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Shell integrations
[ -f ~/.fzfrc ]; source ~/.fzfrc;
# eval "$(fzf --zsh)" # TODO: DEBIAN SO BEHIND
# eval "$(zoxide init --cmd cd zsh)"

#--# AUTO ADDED STUFF BELOW

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

