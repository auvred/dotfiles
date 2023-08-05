local map = require("utils").map

require("buffer_manager").setup({
	select_menu_item_commands = {
		vpslit = {
			key = "<C-v>",
			command = "vsplit",
		},
		split = {
			key = "<C-s>",
			command = "split",
		},
	},
	loop_nav = true,
})

local bmui = require("buffer_manager.ui")
map("n", "<leader>bb", bmui.toggle_quick_menu)
vim.api.nvim_command([[
autocmd FileType buffer_manager vnoremap J :m '>+1<CR>gv=gv
autocmd FileType buffer_manager vnoremap K :m '<-2<CR>gv=gv
]])
