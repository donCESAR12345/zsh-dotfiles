# .zshrc
# Source zshenv to ensure all environment variables are loaded first
source $XDG_CONFIG_HOME/zsh/.zshenv

# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "$ZINIT_HOME/zinit.zsh"

# Add in zsh plugins
# Add in zsh plugins with deferred loading
zinit ice wait'0' lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait'1' lucid
zinit light zsh-users/zsh-completions

zinit ice wait'2' lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'3' lucid
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::podman
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::dnf

# Load completions
autoload -Uz compinit; compinit

zinit cdreplay -q

# Source Starship
eval "$(starship init zsh)"

# Keybindings (emacs because vim sucks here)
bindkey -e

# Options for history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Zsh options
setopt autocd             # Automatically change to a directory without typing 'cd'
setopt correct            # Correct command spelling
setopt nocaseglob         # Case insensitive globbing
setopt notify             # Notify when jobs complete

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"

# Alias definitions
# Quicker git commands
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias ga="git add"

# Better commands
# alias cd="z"
alias docker="podman"
alias ls="eza --color=auto --icons=always"
alias mkdir="mkdir -pv"
alias vi="nvim"
alias vim="nvim"
alias pn="pnpm"
alias npm="pnpm"

# Safety nets
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Zellij
alias zj="zellij"

# I always forget I'm not using neofetch
alias neofetch="fastfetch"

# NeoVim open Godot
alias gnvim="nvim --listen ./godot.pipe"

# Alias for fast TPM reconstruction
alias tpm-regen="sudo systemd-cryptenroll /dev/nvme0n1p3 --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=0,2,4,7,8,9"

# GCloud - jupyter-cesitar
alias gcloud_jupyter_start="curl $GCLOUD_JUPYTER_START_URL"
alias gcloud_jupyter_stop="curl $GCLOUD_JUPYTER_STOP_URL"

gcloud_jupyter_get_ip() {
    export JUPYTER_CESITAR_IP=$(gcloud compute instances list --project "$GCLOUD_JUPYTER_PROJECT_ID" | awk '/jupyter-cesitar-mega/ { print $5 }')
    echo $JUPYTER_CESITAR_IP
}
