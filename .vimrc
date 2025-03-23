syntax on

set number
set relativenumber

colorscheme lunaperche

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set wildmenu
set wildmode=longest,list,full
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<Tab>"

call plug#end()
