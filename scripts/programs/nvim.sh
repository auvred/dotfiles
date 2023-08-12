if [[ $(command -v nvim) ]]; then
  nvim --headless "+Lazy! install" +qa

  # Slim won't have coc.nvim :(
  if [[ $MY_WORKSPACE_TYPE != dev-container-slim ]]; then
    mkdir -p ~/.config/coc/extensions
    
    # TODO: remove after https://github.com/neoclide/coc-tsserver/issues/434 will be resolved
    # i just don't want to download bloated typescript package twice for slim container
    packagejson='{
  "overrides": {
    "typescript": "^5.0.0"
  }
}'
    echo $packagejson > ~/.config/coc/extensions/package.json

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
      -C ~/.config/coc/extensions \
      $coc_extensions
  fi
fi
