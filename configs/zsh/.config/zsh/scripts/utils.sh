install_binary() {
  local url=$1

  wget -qq -cO- $url | sudo tar -xz -C /usr/local/bin
}

install_deb_package() {
  local url=$1
  local dest=$(mktemp).deb

  wget -qq -cO $dest $url
  sudo apt install -y $dest
  rm -f $dest
}

download_file_if_not_exist() {
  local url=$1
  local dest=$2

  if [[ ! -f $dest ]]; then
    curl -SsL $url -o $dest
  fi
}

source_if_exist() {
  if [[ -f $1 ]]; then
    . $1
  fi
}
