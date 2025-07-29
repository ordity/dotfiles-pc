# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt autocd
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bsaw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Create zinit directory if it doesn't exist
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# if [ ! -d "$ZINIT_HOME" ]; then
#     mkdir -p "$(dirname $ZINIT_HOME)"
#     git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# fi

source "${ZINIT_HOME}/zinit.zsh"

# zinit plugins:
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

fpath=($ZINIT_HOME/../plugins/zsh-users---zsh-completions/src $fpath)

# autoload
autoload -U compinit && compinit

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zsh_ohmyposh.yaml)"


(cat ~/.config/wpg/sequences &)

if [ -z "$TMUX" ]; then
    tmux
fi

. $HOME/.zshyazi
. $HOME/.zalias
export LESSOPEN='| /usr/bin/source-highlight-esc.sh %s'
export LESS='-R'
export EDITOR='nvim'

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
