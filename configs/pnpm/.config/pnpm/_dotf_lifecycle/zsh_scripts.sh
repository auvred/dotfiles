init_pnpm_package() {
  echo "{\"packageManager\":\"pnpm@$(curl https://registry.npmjs.com/pnpm | jq '.["dist-tags"].latest' -r)\"}" | jq > package.json
}
