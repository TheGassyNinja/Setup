# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias br='source ~/.bashrc'
alias ls='ls -a --color=auto'
alias c='clear'
alias cl='clear && ls'


PS1=' [ \h ] [ \W ] '