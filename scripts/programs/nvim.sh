curl -LS https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb -o /tmp/nvim.deb
sudo apt install /tmp/nvim.deb
rm /tmp/nvim.deb

nvim --headless "+Lazy! sync" +qa

mkdir -p ~/.config/coc/extensions
echo '{"dependencies": {}}' >~/.config/coc/extensions/package.json
npm install --install-strategy=shallow --ignore-scripts --no-bin-links --no-package-lock --omit=dev -C ~/.config/coc/extensions $(nvim --headless -c'echo g:coc_global_extensions | quit' 2>&1 | tail -n1 | sed "s=\(', '\|\['\|']\)=\n=g")
