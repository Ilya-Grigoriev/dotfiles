export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git
    autojump
    zsh-autosuggestions
    poetry
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias find_package="sudo pacman -Ss "
alias install_package="sudo pacman -S "
