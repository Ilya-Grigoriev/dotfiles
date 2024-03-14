export DOTFILES=$HOME/.config
export ZSH=$DOTFILES/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    poetry
)

source $ZSH/oh-my-zsh.sh

for file in $(ls -d $DOTFILES/aliases/*) ; do
  if [ -f "$file" ] ; then
    source "$file"
  fi
done

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export FZF_ALT_C_COMMAND="fd --type d -H . ~"
zle     -N            fzf-cd-widget
bindkey '\eo' fzf-cd-widget

bindkey -s '^n' 'nnn -H\n'
