npx -y prettier-pnp \
  --pn sh \
  --write \
  .github \
  scripts \
  .zsh/scripts/*.sh \
  install.sh

npx -y @johnnymorganz/stylua-bin .config/nvim
