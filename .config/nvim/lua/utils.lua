local Utils = {}

function Utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Utils.isDevContainerSlim = vim.env.MY_WORKSPACE_TYPE == "dev-container-slim"

return Utils
