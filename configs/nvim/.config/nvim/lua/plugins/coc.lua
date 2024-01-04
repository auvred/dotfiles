local map = require("utils").map

vim.g.coc_global_extensions = {
  "coc-json",
  "coc-emmet",
  "coc-eslint",
  "coc-tsserver",
  "coc-twoslash-queries",
  "@yaegassy/coc-volar",
  "coc-rust-analyzer",
  "coc-yaml",
}

function show_docs()
  local cw = vim.fn.expand("<cword>")
  if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command("h " .. cw)
  elseif vim.api.nvim_eval("coc#rpc#ready()") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

map("n", "K", show_docs, { silent = true })
map("i", "<C-space>", "coc#refresh()", { silent = true, expr = true })

function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
map(
  "i",
  "<TAB>",
  'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  { silent = true, expr = true }
)

map(
  "i",
  "<S-TAB>",
  [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
  { silent = true, expr = true }
)
map("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
map("n", "<leader>gd", "<Plug>(coc-definition)", { silent = true })
map("n", "<leader>gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "<leader>gr", "<Plug>(coc-references)", { silent = true })
map("n", "<leader>ca", "v<Plug>(coc-codeaction-selected)", { silent = true })
