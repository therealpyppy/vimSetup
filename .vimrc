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

" --- Plugin manager setup ---
call plug#begin('~/.vim/plugged')

" Autocomplete plugin with LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting for many languages (very popular and well-maintained)
Plug 'sheerun/vim-polyglot'

" Inline git info
Plug 'airblade/vim-gitgutter'
let g:gitgutter_highlight_lines = 1

" Easily find/visualize code blocks
Plug 'andymass/vim-matchup'

" Color code highlighter
Plug 'ap/vim-css-color'

call plug#end()

" --- coc.nvim Configuration ---

" Use <Tab> and <Enter> to navigate and confirm completion items
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

" Enable filetype plugins & indent
filetype plugin indent on

" Use system clipboard for yank/paste (optional, but useful)
set clipboard=unnamedplus

" Enable mouse support (optional)
set mouse=a

function! CompileAndRun()
  " Save the current file
  write

  " Get the file extension
  let l:ext = expand('%:e')
  " Get the filename without extension
  let l:filename = expand('%:t:r')

  if l:ext ==# 'java'
    " Compile Java file
    let l:compile_cmd = 'javac ' . shellescape(expand('%'))
    " Run Java class (main class assumed same as filename)
    let l:run_cmd = 'java ' . l:filename

    " Try compile
    echo "Compiling " . l:filename . ".java..."
    let l:compile_output = system(l:compile_cmd)

    if v:shell_error
      echohl ErrorMsg
      echo "Compilation failed!"
      echohl None
      " Show the compiler output in a window
      new
      setlocal buftype=nofile bufhidden=wipe noswapfile
      call setline(1, split(l:compile_output, "\n"))
      return
    endif

    " Run program
    echo "Running " . l:filename . "..."
    execute '!' . l:run_cmd
  else
    echohl WarningMsg
    echo "No compile/run setup for *." . l:ext
    echohl None
  endif
endfunction

" Map <F9> to compile and run the current file
nnoremap <F9> :call CompileAndRun()<CR>

