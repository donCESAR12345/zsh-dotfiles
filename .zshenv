# Basics
export EDITOR=nvim

# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Shell
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
export FPATH=$FPATH:"$XDG_DATA_HOME/zsh/completions/"

# Cargo and Rustup
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Conda
export CONDA_ENV="$HOME/.conda/envs/academy/share/jupyter/kernels/python3"

# GNUPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# GTK2
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_USE_PORTAL=1

# Keras
export KERAS_HOME="$XDG_STATE_HOME/keras"

# KDE
export KDEHOME="$XDG_CONFIG_HOME/kde"

# Less
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

# NPM
# export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/npm-global"
# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# NVM
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# NuGet
export NUGET

# Mozilla
export MOZILLA_CONFIG="$XDG_CONFIG_HOME/mozilla"
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export MOZ_ENABLE_WAYLAND=1
fi

# PNPM
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# Pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

# iPython
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

# Jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# MySQL
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"

# Vagrant
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"

# Spicetify
export PATH=$PATH:/home/cesar/.spicetify

# Systemd
export SYSTEMD_EDITOR=$EDITOR

# TERM
# export TERM=alacritty

# Warp terminal
export WARP_ENABLE_WAYLAND=1

# Wine
export WINEPREFIX="$XDG_DATA_HOME/wine"

# PATH
PATH=$PATH:"$CARGO_HOME/bin"
PATH=$PATH:"$XDG_DATA_HOME/bin"
PATH=$PATH:"$HOME/.local/bin"
PATH=$PATH:"$XDG_DATA_HOME/gem/ruby/3.0.0/bin"
PATH=$PATH:"$PYENV_ROOT/bin"
PATH=$PATH:"$PNPM_HOME"
PATH=$PATH:"$HOME/.spicetify"

# Sensitive data
if [ -f "$ZDOTDIR/.env" ]; then
    source "$ZDOTDIR/.env"
fi

