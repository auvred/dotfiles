sudo apt update && sudo apt full-upgrade -y

dotfilesDir=$HOME/.dotfiles

# this was stolen from here https://github.com/victoriadrake/dotfiles/blob/77165d72f17e91b457e2b7a1d83c632eb3698d61/scripts/install.sh
function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install git
install htop
install jq

for f in $dotfilesDir/scripts/programs/*.sh; do bash "$f" -H; done


# this was stolen from here https://github.com/tomnomnom/dotfiles/blob/d2f90b12081f3d4364795a834df7fa8890aed6cd/setup.sh
function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .p10k.zsh
linkDotfile .zshrc
