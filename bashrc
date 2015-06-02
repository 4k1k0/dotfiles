#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#WAKO
alias localhost='sudo /opt/lampp/lampp start'
alias actualizar='yaourt -Syua'
alias archivos='sudo pcmanfm'
alias instalar='sudo pacman -S'
alias yinstalar='yaourt -S'

#PS1='\u@\h \w\$'
PS1='\W\$ '
