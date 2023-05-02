sudo apt update && sudo apt full-upgrade -y

dotfiles_dir=$HOME/.dotfiles

sudo apt install -y \
  curl \
  git \
  htop \
  jq \
  exa \
  rsync \
  ripgrep \
  bat \
  fd-find

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
  ln -s ${dotfiles_dir}/${1} ${dest}
}

echo
echo "Linking dotfiles..."
echo

mkdir -p ~/.config
linkDotfile .p10k.zsh
linkDotfile .zshrc
linkDotfile .config/nvim
linkDotfile .config/bat

echo
echo "Installation scripts"
echo

programs=(
  "zsh"
  "nvim"
  "fzf"
  "bat"
)

for p in ${programs[@]}; do
  echo
  echo "Running '$p' program installation script..."
  file_path="$HOME/.dotfiles/scripts/programs/$p.sh"
  if [[ -f "$file_path" ]]; then
    bash "$file_path" -H
  else
    echo "Script $file_path not found. Skipping..."
  fi
done
