# Created by newuser for 5.0.5

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#WAKO
alias localhost='sudo /opt/lampp/lampp start'
alias actualizar='yaourt -Syua'
alias archivos='sudo pcmanfm'
alias instalar='sudo pacman -S'
alias yinstalar='yaourt -S'
alias music='mpd ~/.mpd/mpd.conf'


autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
#prompt walters


PROMPT="%1~ $ "
