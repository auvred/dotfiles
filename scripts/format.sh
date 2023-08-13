npx -y prettier-pnp \
  --pn sh \
  --write \
  .github \
  configs/**/*.sh \
  configs/**/*.json \
  scripts \
  install.sh \
  *.md

npx -y @johnnymorganz/stylua-bin configs/nvim/.config/nvim
