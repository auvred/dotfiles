p10k_version=1.19.0
installation_dir=$(dirname $0)/powerlevel10k
installed_version_file=$installation_dir/_dotf_version

if [[ -d $installation_dir && -f $installed_version_file && $(cat $installed_version_file) == $p10k_version ]]; then
  echo "Powerlevel10k already installed"
else
  echo "Installing Powerlevel10k v$p10k_version from Github Release"
  wget -qq -cO- https://github.com/romkatv/powerlevel10k/archive/refs/tags/v$p10k_version.tar.gz \
    | tar -xz -C $(dirname $0)

  mv $(dirname $0)/powerlevel10k-$p10k_version $installation_dir
  echo "$p10k_version" > $installed_version_file
fi
