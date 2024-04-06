#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
