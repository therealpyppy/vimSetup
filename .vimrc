" --- General settings ---
syntax on
set t_Co=256
set termguicolors
set background=dark

" Line numbers
set number
set relativenumber

" Tab completion UI
set wildmenu
set wildmode=longest,list,full

" Colorscheme
colorscheme lunaperche

" --- Plugin list ---
" Syntax highlighting: sheerun/vim-polyglot
" Auto complete: neoclide/coc.nvim

call plug#begin('~/.vim/plugged')

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

call plug#end()

" --- CoC.nvim Configuration ---

" Tab to accept completion or fallback
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<Tab>"
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

" Show documentation on hover
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Enable filetype plugins
filetype plugin indent on

