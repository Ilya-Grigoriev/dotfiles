export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.config/

ZSH_THEME="robbyrussell"

plugins=(
    git
    autojump
    zsh-autosuggestions
    zsh-syntax-highlighting
    poetry
)

source $ZSH/oh-my-zsh.sh
source /home/ilia/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.aliases

export FZF_ALT_C_COMMAND="fd --type d -H . ~"
bindkey '\eo' fzf-cd-widget

bindkey -s '^n' 'nnn\n'
