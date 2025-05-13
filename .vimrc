set number relativenumber
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set list lcs=tab:>-,eol:$,trail:·
set signcolumn=number
set modeline
set splitright splitbelow
set showcmd showmatch
set foldcolumn=2
syntax on
colorscheme monokai  " Compatible with coc.vim -- https://github.com/crusoexia/vim-monokai
highlight! link SpecialKey NonText

" How to Do 90% of What Plugins Do (With Just Vim)
set path+=**  " :find <file> from cur/**
cnoreabbrev vsf vert sf
cnoreabbrev vsb vert sb

" Netrw 
" nnoremap - :Explore<CR>
nnoremap _ :Lexplore<CR>

"let g:netrw_liststyle = 3                  " Tree view
let g:netrw_banner = 0                     " Hide banner
let g:netrw_winsize = 30                   " Width of Lexplore window

" tpope (commentary surround)
filetype plugin indent on

" cscope: https://cscope.sourceforge.net/cscope_vim_tutorial.html
" Usage:
" ```
"   # to build index in current directory recursively
"   cscope -bkqR
"   # select files manually
"   find . -name '*.c' -o -name -name '*.h' > cscope.files
"   cscope -bkqRi cscope.files
" ```
"
