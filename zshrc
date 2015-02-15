autoload -U compinit promptinit
compinit
promptinit
# This will set the default prompt to the walters theme
prompt walters
PS1="%B%(?..[%?] )%b%n @ %m >> "
zstyle ':completion:*' menu select
setopt completealiases
source /usr/share/doc/pkgfile/command-not-found.zsh
setopt prompt_subst


# Allow multiple terminal sessions to all append to one zsh command history
 setopt APPEND_HISTORY 
#
# # Add comamnds as they are typed, don't wait until shell exit
 setopt INC_APPEND_HISTORY 
#
# # Do not write events to history that are duplicates of previous events
 setopt HIST_IGNORE_DUPS
#
# # When searching history don't display results already cycled through twice
 setopt HIST_FIND_NO_DUPS
#
# # Remove extra blanks from each command line being added to history
 setopt HIST_REDUCE_BLANKS
#
# # Include more information about when the command was executed, etc
 setopt EXTENDED_HISTORY
#
# # Enables real-time sharing of history across terminal sessions
 setopt SHARE_HISTORY

SAVEHIST=1000
HISTFILE=~/.zsh_history

bindkey '^R' history-incremental-search-backward


alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias rm='rm -i'
