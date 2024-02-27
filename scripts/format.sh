#!/usr/bin/env bash

npx -y prettier-pnp \
  --pn sh \
  --pn toml \
  --write \
  .github \
  configs/**/*.sh \
  configs/**/*.json \
  configs/**/*.toml \
  scripts \
  install.sh \
  *.md

npx -y @johnnymorganz/stylua-bin configs/nvim/.config/nvim
