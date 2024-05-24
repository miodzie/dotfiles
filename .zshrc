# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#--# My config
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"


bindkey -e # emacs keybind mode -- useful
# search previous commands similar to what's currently in the prompt -- e.g. $ curl | <C-p>
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

alias vim="nvim"
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

# Ah yes, auto git clone & source scripts. No problems here, no sir.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::docker-compose
# todo check out these below 
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell integrations
# eval "$(fzf --zsh)" # TODO: DEBIAN SO BEHIND
# eval "$(zoxide init --cmd cd zsh)" # TODO: z train deez phat fucking nutz
. /usr/share/doc/fzf/examples/key-bindings.zsh # "stable distribution"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fzf-ssh() {
  CHOICE="$(cat ~/hosts.txt  | fzf-tmux -p --prompt 'ssh to> ' | awk '{print $3}')"
  [ -z $CHOICE ] && return 0
  echo $CHOICE && ssh $CHOICE
}
alias sshf='fzf-ssh'
zle -N fzf-ssh
# bindkey -s "^e" 'fzf-ssh^M'  # TODO: fix after power10k migration
alias fkill='ps -ef | fzf | awk '{print $2}' | xargs kill -9'


#--# AUTO ADDED STUFF BELOW

