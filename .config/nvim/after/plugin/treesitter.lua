require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "javascript", "typescript", "vue", "html", "css", "scss" },

  sync_install = false,

  highlight = {
    enable = true,
  },
}
