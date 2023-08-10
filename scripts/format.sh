npx -y prettier-pnp \
  --pn sh \
  --write \
  .github \
  scripts \
  install.sh

npx -y @johnnymorganz/stylua-bin .config/nvim
