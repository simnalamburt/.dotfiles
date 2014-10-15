" Base Configuration
set nocompatible
set backspace=indent,eol,start
set enc=utf-8

" My Configuration
colorscheme elflord
syntax on
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

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Decoration for 80 column layout concerns
set textwidth=80
set colorcolumn=+1,+2,+3
highlight ColorColumn ctermbg=black

" Decoration for line number column
set number
set cursorline
highlight LineNr ctermbg=black
highlight CursorLine cterm=none
highlight CursorLineNr ctermfg=white ctermbg=black

" Easy navigation
map <up> gk
map <down> gj

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
