for program in $DOTFILES_DIR/configs/*; do
  scripts=$(find $program \
    -maxdepth 4 \
    -regex '.*/_dotf_lifecycle/zsh_scripts.sh$')

  if [[ ! $scripts ]]; then
    continue
  fi

  for script in $scripts; do
    . $script
  done
done
