" Base Configuration
set nocompatible
set backspace=indent,eol,start
set enc=utf-8

" My Configuration
colorscheme elflord
syntax on
set number
set ruler
set history=256

set wildmenu
set showcmd
set noswapfile
set nobackup
set startofline

" Indention
set cindent
set autoindent
set smartindent
filet plugin indent on

" Tab configuration
" (Visual Mode) Tab -> '>', '<'
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
vmap <Tab> >gv
vmap <S-Tab> <gv

" Search
set hlsearch
set nowrapscan

" Pair matching
set matchpairs+=<:>
set showmatch

" <F5> -> '$ make'
    nmap <F5>      :make<CR>
inoremap <F5> <ESC>:make<CR>

" CScope
set cscopetagorder=0
set cscopetag
if filereadable("./cscope.out")
    cs add cscope.out
endif
set cscopeverbose

" autocmd
autocmd BufRead,BufNewFile *.c
            \ if !filereadable("Makefile") && !filereadable("makefile") |
            \ set makeprg=gcc\ %\ -o\ %< |
            \ endif
autocmd BufRead,BufNewFile *.cpp
            \ if !filereadable("Makefile") && !filereadable("makefile") |
            \ set makeprg=g++\ %\ -o\ %< |
            \ endif
autocmd BufRead,BufNewFile *.java
            \ if !filereadable("Makefile") && !filereadable("makefile") |
            \ set makeprg=javac\ % |
            \ endif
autocmd BufRead,BufNewFile *.py
            \ if !filereadable("Makefile") && !filereadable("makefile") |
            \ set makeprg=python\ % |
            \ endif
autocmd BufRead,BufNewFile *.rb
            \ if !filereadable("Makefile") && !filereadable("makefile") |
            \ set makeprg=ruby\ % |
            \ endif
