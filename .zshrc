# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

export VISUAL=nvim
export EDITOR=$VISUAL
set -o vi


# p10k zsh theme
source ~/.dotfiles/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm
if [[ -z "${NVM_DIR}" ]]; then
  export NVM_DIR=$HOME/nvm
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# fzf
FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_CTRL_T_OPTS="
  --preview 'batcat --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_DEFAULT_COMMAND="fdfind --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d $FD_OPTIONS"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_fzf_compgen_path() {
  command fdfind --hidden --follow --exclude .git --exclude node_modules . "$1"
}
_fzf_compgen_dir() {
  command fdfind --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# completion
autoload -Uz compinit && compinit
fpath=(~/.dotfiles/.zsh/completion $fpath)
# docker cli
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# aliases
alias ll="exa -lha"
alias bat="batcat"
alias fd="fdfind"
