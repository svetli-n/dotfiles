alias c="clear"
alias rm="rm -i"
alias eclimd='/home/svetlin/.eclipse/org.eclipse.platform_4.6.2_155965261_linux_gtk_x86_64/eclimd'

export TERM=screen-256color-bce

bindkey -v
bindkey "^R" history-incremental-search-backward

DISABLE_AUTO_TITLE=true

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

setxkbmap -option caps:none

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export GOPATH=~/workspace/go

export PATH=$PATH:/home/svetlin/workspace/go/bin

export PYTHONPATH=/home/svetlin/workspace/learning/spark/spark-2.0.2-bin-hadoop2.7/python/:$PYTHONPATH
