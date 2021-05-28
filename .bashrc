#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="[\u@\h \W on {\$(git symbolic-ref --short HEAD 2>/dev/null)}]\$ "
