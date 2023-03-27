curl -LS https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -o /tmp/nvim.deb
sudo apt install /tmp/nvim.deb
rm /tmp/nvim.deb

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall -c q -c q
git config --global core.editor "nvim"
