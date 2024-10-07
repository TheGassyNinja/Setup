#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[ \h ]  [ \W ] '

alias br='source ~/.bashrc'

alias ..='cd ..'

alias ls='lsd -a --group-directories-first --color=always'
alias ll='lsd -al --group-directories-first'

alias c='clear'
alias cl='clear && ls'

alias pac='sudo pacman -S'
alias pac-rm='sudo pacman -Rs'
alias pac-srch='sudo pacman -Ss'
alias pac-info='sudo pacman -Qi'
alias update='sudo pacman -Syu'

alias list-services='systemctl list-units --type=service --state=running'
alias su-vim='sudo -E vim'
alias chx='chmod +x'
alias grep='grep --color=auto'