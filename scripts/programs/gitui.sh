if ! command -v gitui &> /dev/null; then
  echo "gitui not found. installing from gh release"

  cd /tmp
  wget https://github.com/extrawurst/gitui/releases/download/v0.22.1/gitui-linux-musl.tar.gz
  tar xf gitui-linux-musl.tar.gz
  sudo mv gitui /usr/local/bin/gitui
else
  echo "gitui found. skipping installation..."
fi

