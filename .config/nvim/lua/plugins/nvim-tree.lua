local map = require("utils").map

require("nvim-tree").setup({
	view = {
		preserve_window_proportions = true,
		number = true,
		relativenumber = true,
	},
	git = {
		ignore = false,
	},
})

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

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

map("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
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

map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { silent = true, expr = true })
map("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
map("n", "<leader>gd", "<Plug>(coc-definition)", { silent = true })
map("n", "<leader>gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "<leader>gr", "<Plug>(coc-references)", { silent = true })
map("n", "<leader>ca", "v<Plug>(coc-codeaction-selected)", { silent = true })
