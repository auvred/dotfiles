local map = require("utils").map

require("nvim-tree").setup({
  view = {
    preserve_window_proportions = true,
    float = {
      enable = true,
      open_win_config = {
        border = "double",
        width = 60,
        height = 50,
      },
    },
  },
  git = {
    ignore = false,
  },
})

local function open_nvim_tree(data)
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  if directory then
    vim.cmd.cd(data.file)
  end

  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>E", function()
  require("nvim-tree.api").tree.toggle({ current_window = true })
end, { silent = true })
