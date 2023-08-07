require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "html",
    "css",
    "scss",
    "rust",
  },

  sync_install = true,

  highlight = {
    enable = true,
  },
})
