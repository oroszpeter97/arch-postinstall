#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -1'
alias grep='grep --color=auto'
alias mpv='mpv --pause --loop=inf --no-border'
alias feh='feh -.'
PS1='[\u@\h \W]\$ '
