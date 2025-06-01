set number relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set list lcs=tab:>-,eol:$,trail:·
set modeline
set splitright splitbelow
set showcmd showmatch
set foldcolumn=2
syntax on
colorscheme monokai  " Compatible with coc.vim -- https://github.com/Ice1187/vim-monokai
highlight! link SpecialKey NonText

" How to Do 90% of What Plugins Do (With Just Vim)
set path+=**  " :find <file> from cur/**
cnoreabbrev vsf vert sf
cnoreabbrev vsb vert sb

" python indent, see :help ft-python-indent
if !exists('g:python_indent')
    let g:python_indent = {}
endif
let g:python_indent.open_paren = 'shiftwidth()'
let g:python_indent.closed_paren_align_last_line = v:false

" quickfix mode
" auto save before :make
command! -nargs=* -bang Make update | make<bang> <args>
cnoreabbrev <expr> make getcmdtype() == ':' && getcmdline() =~ '^make' ? 'Make' : 'make'
autocmd QuickFixCmdPost [^l]* cwindow
autocmd QuickFixCmdPost l* lwindow
nnoremap <nowait> ]q :cnext<CR>zz
nnoremap <nowait> [q :cprevious<CR>zz
autocmd FileType python setlocal makeprg=uv\ run\ %\ $*
autocmd FileType python setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" tpope (commentary surround)
filetype plugin indent on

" omni completion (ctrl-x ctrl-o) for languages syntax
set omnifunc=syntaxcomplete#Complete

" view Man page
autocmd FileType c,cpp runtime ftplugin/man.vim

" Netrw 
" nnoremap - :Explore<CR>
nnoremap _ :Lexplore<CR>
"let g:netrw_liststyle = 3                  " Tree view
let g:netrw_banner = 0                     " Hide banner
let g:netrw_winsize = 30                   " Width of Lexplore window

" Tmux integration, see :help tmux-integration
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    if empty(&t_Ts) && empty(&t_Te)
        let &t_Ts = "\e[9m"   " Strikethrough, see :help terminal-output-codes
        let &t_Te = "\e[29m"
    endif
endif

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
