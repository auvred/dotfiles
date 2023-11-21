. $DOTFILES_SCRIPT_UTILS

watchman_version=v2023.10.09.00

if [[ $(command -v nvim) ]]; then
  nvim --headless "+Lazy! install" +qa

  coc_extensions_location=$HOME/.config/coc/extensions

  # Slim won't have coc.nvim :(
  if [[ $MY_WORKSPACE_TYPE != dev-container-slim ]]; then
    mkdir -p $coc_extensions_location

    packagejson='{}'
    echo $packagejson > $coc_extensions_location/package.json

    coc_extensions=$(nvim \
      --headless \
      -c'echo g:coc_global_extensions | quit' 2>&1 \
      | tail -n1 \
      | sed "s=\(', '\|\['\|']\)=\n=g")

    npm install \
      --ignore-scripts \
      --no-bin-links \
      --no-package-lock \
      --omit=dev \
      --install-strategy=shallow \
      -C $coc_extensions_location \
      $coc_extensions

    install_deb_package https://github.com/facebook/watchman/releases/download/${watchman_version}/watchman_ubuntu22.04_${watchman_version}.deb
  fi
fi
