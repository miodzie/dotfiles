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
