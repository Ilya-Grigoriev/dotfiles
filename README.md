# dotfiles

# Hardware:

- [zsh](https://github.com/ohmyzsh/ohmyzsh)
- [tmux](https://github.com/tmux/tmux) **`>= 1.9`**
- [alacritty](https://github.com/alacritty/alacritty) (using?)
- [fzf](https://github.com/junegunn/fzf) - tool for finding files/directories
- [fd](https://github.com/sharkdp/fd) - tool for finding files/directories
- [nnn](https://github.com/jarun/nnn) - file manager in terminal
- [vieb](https://github.com/Jelmerro/Vieb) - Vi-mode browser
- [i3wm](https://github.com/i3/i3)
- [dwm](https://dwm.suckless.org/)
- [bspwm](https://github.com/baskerville/bspwm)
- [entr](https://github.com/eradman/entr) - commands automation
- [nsxiv](https://github.com/nsxiv/nsxiv) - image viewer
- [sent](https://tools.suckless.org/sent/) - presentation tool
- [urxvt](https://wiki.archlinux.org/title/Rxvt-unicode) - terminal
- [flameshot](https://github.com/flameshot-org/flameshot) - screenshot tool
- [feh](https://github.com/derf/feh) - wallpaper manager
- [pass](https://wiki.archlinux.org/title/Pass) - password manager
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - youtube downloader
- [cmus](https://github.com/cmus/cmus) - music player
- [glow](https://github.com/charmbracelet/glow) - markdown viewer
- [tuir](https://github.com/c4pt0r/tuir) - Reddit TUI
- [antiword](https://linux.die.net/man/1/antiword) - display Word document text
- [abiword](https://wiki.archlinux.org/title/AbiWord) - Word processor
- [invidtui](https://github.com/darkhz/invidtui) - YouTube TUI
- [discordo](https://github.com/ayn2op/discordo) - Discord TUI
- [Thorium](https://thorium.rocks/) - the fastest browser on Chromium
- [Mercury](https://thorium.rocks/mercury) - cool Firefox fork
- [zaread](https://github.com/paoloap/zaread) - script for opening Microsoft Office documents
- [vhs](https://github.com/charmbracelet/vhs) - tool for recording CLI
- [sc-im](https://github.com/andmarti1424/sc-im) - spreadsheet calculator
- For tmux config:
  - [tmux plugin manager](https://github.com/tmux-plugins/tpm)
- For zsh config:
  - [auto-suggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - [autojump](https://github.com/wting/autojump)
  - [poetry](https://python-poetry.org/)
- For dwm:
  - [dwmstatus](https://dwm.suckless.org/status_monitor/)
  - [pipewire](https://archlinux.org/packages/?name=pipewire)
  - patches:
    - [horizontal](https://dwm.suckless.org/patches/horizontal/)
    - [movecenter](https://dwm.suckless.org/patches/movecenter/)
    - [moveresize](https://dwm.suckless.org/patches/moveresize/)
    - [noborder](https://dwm.suckless.org/patches/noborder/)
    - [hidebar](https://dwm.suckless.org/patches/hideborder/)
- For st:
    - patches:
        - [changealpha](https://st.suckless.org/patches/changealpha/)
        - [copyurl](https://st.suckless.org/patches/copyurl/)
        - [openclipboard](https://st.suckless.org/patches/open_copied_url/)
        - [anygeometry](https://st.suckless.org/patches/anygeometry/)
- For i3wm:
  - [xkblayout-state](https://github.com/nonpop/xkblayout-state)
  - [i3blocks](https://github.com/vivien/i3blocks)
  - [i3lock](https://github.com/i3/i3lock)

# Installation

- If you are asked about installing something, then enter "yes" if you agree.

```bash
git clone git@github.com:ilya-grigoriev/dotfiles.git
cd dotfiles.git
bash depend.sh
```

> Instructions below don't need to be followed if you run `depend.sh`!
# Zsh configuration

- To work well, you need to set `$ZDOTDIR` (from `/etc/zsh/zshenv/`) to `ZDOTDIR=$HOME/.config/zsh`.
- To history saving work well, you also need to set `$HISTFILE`.
- Just paste following code:

```
export ZDOTDIR=~/.config/zsh
export HISTFILE=$ZDOTDIR/history
```

- All `.zsh*` files need to be moved to `~/.config/zsh`.

# Urxvt configuration

- To work well, you need to create `/usr/lib/urxvt/perl` folder and move to this config files from [urxvt-perls](https://github.com/xyb3rt/urxvt-perls).

# GRUB configuration
- I use [HyperFluent-GRUB-Theme Debian](https://github.com/Coopydood/HyperFluent-GRUB-Theme), but with [other wallpaper](https://github.com/ilya-grigoriev/dotfiles/blob/main/ims/wallpapers/background_grub.png).
- Also need to change background of GRUB:
```
# /etc/default/grub
GRUB_BACKGROUND=~/ims/wallpapers/background_grub.png
```

# SDDM configuration
- For [SDDM](https://wiki.archlinux.org/title/SDDM) I use [this wallpaper](https://github.com/ilya-grigoriev/dotfiles/blob/main/ims/wallpapers/strange.png).
