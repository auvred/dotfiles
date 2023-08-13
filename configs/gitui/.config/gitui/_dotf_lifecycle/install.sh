. $DOTFILES_SCRIPT_UTILS
. $(dirname $0)/constants.sh

if [[ ! $(command -v gitui) ]] || [[ ! $(gitui --version) == "gitui $gitui_version" ]]; then
  download_binary https://github.com/extrawurst/gitui/releases/download/v$gitui_version/gitui-linux-musl.tar.gz
fi
