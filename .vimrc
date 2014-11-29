"
" Vundle
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'gkz/vim-ls'
Plugin 'slim-template/vim-slim'
Plugin 'sophacles/vim-processing'
Plugin 'wting/rust.vim'

call vundle#end()
filetype plugin indent on



"
" vimrc
"

" Base Configuration
set backspace=indent,eol,start
set enc=utf-8

" My Configuration
colorscheme elflord
syntax on
set ruler
set history=256
set wildmenu
set showcmd
set startofline
set noswapfile
set nobackup
set nofoldenable

" Indention
set cindent
set autoindent
set smartindent

" Tab
set softtabstop=2
set shiftwidth=2
set expandtab

" Search
set incsearch
set hlsearch
set nowrapscan

" Pair matching
set matchpairs+=<:>
set showmatch

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

" Easy indentation
vmap <Tab> >gv
vmap <S-Tab> <gv
