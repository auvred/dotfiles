vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  use {'neoclide/coc.nvim', branch = 'release'}
  vim.g.coc_global_extensions = { 'coc-json', 'coc-emmet', 'coc-eslint', 'coc-tsserver', '@yaegassy/coc-volar' }

  use 'navarasu/onedark.nvim'


  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end
  }
  vim.api.nvim_create_autocmd('BufEnter', {
    nested = true,
    callback = function()
      if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf() then
        vim.cmd 'quit'
      end
    end
  })


  use {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        timeout = 200
      }
    end,
  }


  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

end)
