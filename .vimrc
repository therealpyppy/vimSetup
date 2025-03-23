syntax on

set t_Co=256
set background=dark
set termguicolors
set number
set relativenumber

colorscheme lunaperche

" - Plugin list -
" Autofill: neoclide/coc.nvim
" Better syntax highlighting: sheerun/vim-polyglot

call plug#begin('~/.vim/plugged')

" Autofill
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set wildmenu
set wildmode=longest,list,full
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<Tab>"

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

call plug#end()
