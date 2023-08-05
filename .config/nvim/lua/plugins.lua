local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
		"j-morano/buffer_manager.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.buffer-manager")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
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
		opts = {
			filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
			remove_template_string = true,
			restore_quotes = {
				normal = [[']],
				jsx = [["]],
			},
		},
		event = "InsertEnter",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
	},
})
