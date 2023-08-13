download_binary() {
  local url=$1

  wget -qq -cO- $url | sudo tar -xz -C /usr/local/bin
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
