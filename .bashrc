#
# ~/.bashrc
#

# If not running interactively, don't do anything
# [[ $- == *i* ]] && return


set -o noclobber


export DOTFILES="$HOME/.config"


GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
PS1="${GREEN}[\W]${RESET} "


for file in $(ls -d $DOTFILES/aliases/*) ; do
  if [ -f "$file" ] ; then
    source "$file"
  fi
done


source $DOTFILES/zsh/.zshenv


fzf-cd(){
    cd $(find | fzf )
}
export FZF_ALT_C_COMMAND="fd --type d -H . ~"
bind -x '"\em": fzf-cd'


shopt -s autocd


[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
