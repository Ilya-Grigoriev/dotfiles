# dotfiles

# Components:

- [zsh](https://github.com/ohmyzsh/ohmyzsh)
- [alacritty](https://github.com/alacritty/alacritty)
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- [nnn](https://github.com/jarun/nnn)
- [vieb](https://github.com/Jelmerro/Vieb)
- [i3wm](https://github.com/i3/i3)
- [entr](https://github.com/eradman/entr)
- [nsxiv](https://github.com/nsxiv/nsxiv)
- [sent](https://tools.suckless.org/sent/)
- [urxvt](https://wiki.archlinux.org/title/Rxvt-unicode)
- For tmux config:
  - [tmux](https://github.com/tmux/tmux) **`>= 1.9`**
  - [tmux plugin manager](https://github.com/tmux-plugins/tpm)
- For zsh config:
  - [auto-suggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - [autojump](https://github.com/wting/autojump)
  - [poetry](https://python-poetry.org/)
- For dwm:
  - [dwmstatus](https://dwm.suckless.org/status_monitor/)
- For i3wm:
  - [i3blocks](https://github.com/vivien/i3blocks)
  - [i3lock](https://github.com/i3/i3lock)
  - [copyq](https://github.com/hluk/CopyQ)
  - [flameshot](https://github.com/flameshot-org/flameshot)
  - [xkblayout-state](https://github.com/nonpop/xkblayout-state)
  - [feh](https://github.com/derf/feh)

# Installation

- Unix:

```bash
git clone git@github.com:ilya-grigoriev/dotfiles.git ~/.
```

# Zsh configuration

- To work well, you need to set `$ZDOTDIR` (from `/etc/zsh/zshenv/`) to `ZDOTDIR=$HOME/.config/zsh`.
- Just paste following code:

```
export ZDOTDIR=$HOME/.config/zsh
```

- All `.zsh*` files need to be moved to `~/.config/zsh`.
