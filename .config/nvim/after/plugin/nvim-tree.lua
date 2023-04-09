require('nvim-tree').setup {
  view = {
    preserve_window_proportions = true,
    number = true,
    relativenumber = true
  },
  git = {
    ignore = false
  }
}

local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- vim.api.nvim_create_autocmd('BufEnter', {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf() then
--       vim.cmd 'quit'
--     end
--   end
-- })
