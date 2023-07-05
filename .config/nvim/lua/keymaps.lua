vim.g.mapleader = ' '

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-b>', ':NvimTreeToggle<CR>', { silent = true })

-- Use K to show Coc documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
map('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- trigger completion
map('i', '<C-space>', 'coc#refresh()', { silent = true, expr = true })

map('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { silent = true, expr = true })
map('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { silent = true, expr = true })

map('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
map('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

map('n', '<leader>gd', '<Plug>(coc-definition)', {silent = true})
map('n', '<leader>gi', '<Plug>(coc-implementation)', {silent = true})
map('n', '<leader>gr', '<Plug>(coc-references)', {silent = true})

map('n', '<leader>ca', 'v<Plug>(coc-codeaction-selected)', {silent = true})
