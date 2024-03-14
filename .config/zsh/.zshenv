export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPENER=nuke
export NNN_PLUG='d:dragdrop;g:!xdg-open "$nnn";x:!chmod +x "$nnn";t:preview-tabbed'
export NNN_USE_EDITOR=1
export NNN_BMS="d:$HOME/Docs;u:/home/user/Cam Uploads;D:$HOME/Downloads/"

export PATH=$PATH:/usr/local/go/bin

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export GROFF_TMAC_PATH="~/mom-2.6"

export ANDROID_HOME="$XDG_DATA_HOME/android"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

xrdb -load "$XDG_CONFIG_HOME/x11/xresources"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
. "/home/ilya/.local/share/cargo/env"

export GOPATH="$XDG_DATA_HOME"/go

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export PYTHONSTARTUP="/etc/python/pythonrc"

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export LESSHISTFILE="$XDG_STATE_HOME"/less/history

export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export W3M_DIR="$XDG_DATA_HOME"/w3m

export PATH="$PATH:/opt/nvim-linux64/bin"
