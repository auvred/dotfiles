local cmd = vim.cmd
local opt = vim.opt
local utils = require("utils")

cmd("syntax enable")
opt.termguicolors = true

-- highlight yanked text
vim.api.nvim_exec(
  [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup end
]],
  false
)

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 3
opt.smartindent = true
opt.wrap = true
opt.cursorline = true
opt.scrolloff = 10
opt.ignorecase = true
opt.updatetime = 300

utils.map("t", "<C-w>", "<C-\\><C-n><C-w>")
