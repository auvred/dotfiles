. $DOTFILES_SCRIPT_UTILS
. $(dirname $0)/constants.sh

if [[ ! $(command -v fzf) ]] || [[ ! $(fzf --version) == $fzf_version* ]]; then
  install_binary https://github.com/junegunn/fzf/releases/download/$fzf_version/fzf-$fzf_version-linux_amd64.tar.gz
fi

mkdir -p $(dirname $fzf_completion_dest)
mkdir -p $(dirname $fzf_key_bindings_dest)

download_file_if_not_exist \
  https://raw.githubusercontent.com/junegunn/fzf/$fzf_version/shell/completion.zsh \
  $fzf_completion_dest

download_file_if_not_exist \
  https://raw.githubusercontent.com/junegunn/fzf/$fzf_version/shell/key-bindings.zsh \
  $fzf_key_bindings_dest
