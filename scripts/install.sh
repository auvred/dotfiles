print_phase_name() {
  printf "\n\n\n\n\n"
  printf "   === %s ===" "$1"
  printf "\n\n\n\n\n"
}

set -euo pipefail

print_phase_name "Installing common deps"

sudo apt update
sudo apt full-upgrade -y
sudo apt install -y \
  curl \
  exa \
  git \
  htop \
  jq \
  rsync \
  stow \
  tree \
  wget

print_phase_name "Linking configs"

cd ~/.dotfiles/configs
mkdir -p ~/.config

for program in *; do
  stow -R -v -t ~ $program
done

print_phase_name "Running 'install' scripts"

export DOTFILES_SCRIPT_UTILS=$HOME/.config/zsh/scripts/utils.sh

for program in *; do
  scripts=$(find $program \
    -maxdepth 4 \
    -regex '.*/_dotf_lifecycle/install.sh$')

  if [[ ! $scripts ]]; then
    continue
  fi

  printf "\n\n\n   [$program] Running 'install' lifecycle scripts\n\n" $program

  for script in $scripts; do
    printf " >> %s\n" $script
    bash $script
    exit_code=$?
    printf " >> %s - Done. Exit code - %s\n" $script $exit_code
    if [ $exit_code -ne 0 ]; then
      printf "Exit code - \"%s\". Exiting\n" $exit_code
      exit 1
    fi
  done

  printf "\n   [$program] 'install' lifecycle scripts end\n\n\n" $program
done
