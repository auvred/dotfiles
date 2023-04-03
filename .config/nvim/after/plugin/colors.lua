-- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua
require('onedark').setup {
  style = 'warmer',
  highlights = {
    ["@tag"] = { fg = '#5bb576' },
    ["@tag.delimiter"] = { fg = '#c9a157' },
  }
}
require('onedark').load()
