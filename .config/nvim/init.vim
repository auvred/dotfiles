call plug#begin("~/.vim/plugged")
  Plug 'doums/darcula'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-json', 'coc-emmet', 'coc-eslint', 'coc-tsserver']

  Plug 'leafgarland/typescript-vim' 

  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

"Config Section

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme darcula

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

set expandtab
set shiftwidth=2
set tabstop=2
set number
set relativenumber
