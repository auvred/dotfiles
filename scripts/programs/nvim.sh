curl -LS https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -o /tmp/nvim.deb
sudo apt install /tmp/nvim.deb
rm /tmp/nvim.deb

git config --global core.editor "nvim"
