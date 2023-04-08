# TODO: update to latest
curl -LS https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb -o /tmp/nvim.deb
sudo apt install /tmp/nvim.deb
rm /tmp/nvim.deb

PACKER_PATH=~/.local/share/nvim/site/pack/packer/start/packer.nvim
if [ ! -d "$PACKER_PATH" ]
then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_PATH
fi

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'TSUpdateSync' -c q

mkdir -p ~/.config/coc/extensions
echo '{"dependencies": {}}' >~/.config/coc/extensions/package.json
npm install --install-strategy=shallow --ignore-scripts --no-bin-links --no-package-lock --omit=dev -C ~/.config/coc/extensions $(nvim --headless -c'echo g:coc_global_extensions | quit' 2>&1 | tail -n1 | sed "s=\(', '\|\['\|']\)=\n=g")

git config --global core.editor "nvim"
