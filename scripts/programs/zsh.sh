sudo apt install -y zsh

if [ $MY_WORKSPACE_TYPE == 'dev-container' ]; then
  sudo chsh -s $(which zsh) $(whoami)
fi
