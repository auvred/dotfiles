gitui_version=0.23.0

if [[ $(command -v gitui) && $(gitui --version) == "gitui $gitui_version" ]]; then
  echo "gitui found. skipping installation..."
else
  echo "gitui not found. installing from gh release"

  wget -cO- https://github.com/extrawurst/gitui/releases/download/v$gitui_version/gitui-linux-musl.tar.gz | sudo tar -xz -C /usr/local/bin
fi
