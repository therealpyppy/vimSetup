syntax on

set t_Co=256
set background=dark
set termguicolors
set number
set relativenumber

colorscheme lunaperche

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set wildmenu
set wildmode=longest,list,full
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<Tab>"

Plug 'sheerun/vim-polyglot'

call plug#end()
