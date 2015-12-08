alias c="clear"
alias rm="rm -i"

export TERM=screen-256color-bce

bindkey -v
bindkey "^R" history-incremental-search-backward

DISABLE_AUTO_TITLE=true

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

setxkbmap -option caps:none
