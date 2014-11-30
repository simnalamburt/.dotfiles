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
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'gkz/vim-ls'
Plugin 'slim-template/vim-slim'
Plugin 'sophacles/vim-processing'
Plugin 'wting/rust.vim'

call vundle#end()
filetype plugin indent on

" vim-airline
let g:airline_powerline_fonts = 1

" vim-javascript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"



"
" vimrc
"

" Basic configs
set enc=utf-8
set backspace=indent,eol,start
set ruler
set history=256
set wildmenu
set startofline
set noswapfile
set nobackup
set nofoldenable
syntax on
colorscheme elflord

" Indention
set cindent
set autoindent
set smartindent

" Tab
set softtabstop=2
set shiftwidth=2
set expandtab

" Searching
set incsearch
set hlsearch
set nowrapscan

" Pair matching
set matchpairs+=<:>
set showmatch

" Concealing
set concealcursor=nc
set conceallevel=2
highlight Conceal ctermfg=darkblue ctermbg=NONE

" Easy navigation
map <up> gk
map <down> gj

" Easy indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

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
