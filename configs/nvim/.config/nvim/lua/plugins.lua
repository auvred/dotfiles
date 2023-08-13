local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local isDevContainerSlim = require("utils").isDevContainerSlim

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- requires C compiler
    cond = function()
      return not isDevContainerSlim
    end,
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    cond = function()
      return not isDevContainerSlim
    end,
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    -- contains bloated node_modules + requires nodejs
    cond = function()
      return not isDevContainerSlim
    end,
    config = function()
      require("plugins.coc")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("plugins.catppuccin")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.nvim-tree")
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("plugins.better-escape")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "axelvc/template-string.nvim",
    -- requires treesitter
    cond = function()
      return not isDevContainerSlim
    end,
    opts = {
      filetypes = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
      },
      remove_template_string = true,
      restore_quotes = {
        normal = [[']],
        jsx = [["]],
      },
    },
    event = "InsertEnter",
    ft = {
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "vue",
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.neoscroll")
    end,
  },
})
