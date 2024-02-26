HISTFILE=~/.local/state/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit
compinit

setopt share_history
setopt hist_ignore_all_dups

zstyle ':completion:*' menu select
_comp_options+=(globdots)
setopt MENU_COMPLETE
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

bindkey -v
export KEYTIMEOUT=1

eval "$(starship init zsh)"
if [[ -o interactive ]]; then
  eval "$(mise activate zsh)"
else
  eval "$(mise activate zsh --shims)"
fi

export DOTFILES_DIR=$HOME/.dotfiles

for script in ~/.config/zsh/scripts/*; do
  . $script
done
