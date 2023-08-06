if [[ $(command -v nvim) ]]; then
  nvim --headless "+Lazy! install" +qa
  
  mkdir -p ~/.config/coc/extensions
  echo '{"dependencies": {}}' >~/.config/coc/extensions/package.json
  npm install --install-strategy=shallow --ignore-scripts --no-bin-links --no-package-lock --omit=dev -C ~/.config/coc/extensions $(nvim --headless -c'echo g:coc_global_extensions | quit' 2>&1 | tail -n1 | sed "s=\(', '\|\['\|']\)=\n=g")
fi
