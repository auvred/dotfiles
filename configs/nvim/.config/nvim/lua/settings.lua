local cmd = vim.cmd
local opt = vim.opt

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
opt.wrap = true
opt.tabstop = 2
opt.number = true
opt.cursorline = true
opt.cursorcolumn = true
opt.relativenumber = true
opt.scrolloff = 10
opt.ignorecase = true
opt.updatetime = 300
