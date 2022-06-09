#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

alias cdr='cd ~'

PS1="\[\033[36m\]\u \[\033[31m\]\W\[\033[00m\] on \[\033[35m\]\$(git symbolic-ref --short HEAD 2>/dev/null) \[\033[00m\] \[\033[32m\]\[\033[00m\] "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
