. $DOTFILES_SCRIPT_UTILS

bat_version=0.23.0

if [[ ! $(command -v bat) ]] || [[ ! $(bat --version) == "bat $bat_version"* ]]; then
  download_deb_package https://github.com/sharkdp/bat/releases/download/v$bat_version/bat_${bat_version}_amd64.deb
fi

bat cache --build
