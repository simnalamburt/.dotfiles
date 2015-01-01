"
" Vundle
"
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'simnalamburt/vim-mundo'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'gkz/vim-ls'
Plugin 'slim-template/vim-slim'
Plugin 'sophacles/vim-processing'
Plugin 'simnalamburt/vim-rust'
Plugin 'evanmiller/nginx-vim-syntax'

call vundle#end()
filetype plugin indent on



"
" vimrc
"
set enc=utf-8
set backspace=indent,eol,start
set diffopt+=iwhite
set laststatus=2
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set ruler
set startofline
set splitbelow
set nobackup
set nofoldenable
set noshowmode
set noswapfile
set nowrap
syntax on
colorscheme elflord

" History
set history=1024
set undolevels=1024

" Indention
set cindent
set autoindent
set smartindent

" Tab
set softtabstop=2
set shiftwidth=2
set expandtab

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrapscan

" Pair matching
set matchpairs+=<:>
set showmatch
highlight MatchParen ctermfg=black ctermbg=lightgreen

" Wildmenu settings
set wildmenu
set wildmode=full
highlight StatusLine ctermbg=darkgray ctermfg=234
highlight WildMenu   ctermfg=white    ctermbg=234

" listchars for whitespaces
set list
set listchars=tab:›\ ,extends:»,precedes:«
highlight NonText    ctermfg=darkblue
highlight SpecialKey ctermfg=darkblue

" Concealing
set concealcursor=nc
set conceallevel=2
highlight Conceal ctermfg=darkblue ctermbg=NONE

" Key mapping
let mapleader = ","

" Easy file save
nnoremap <silent> S :update<CR>

" Easy navigation
noremap <up> gk
noremap <down> gj

" Easy indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Easy splitting & resizing
nnoremap <silent> <C-_> :split<CR>
nnoremap <silent> <C-\> :vertical split<CR>
nnoremap <silent> <C-h> :vertical resize -5<CR>
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize +5<CR>

" Tab navigations
nnoremap <esc>t   :tabnew<CR>
nnoremap <esc>1   1gt
nnoremap <esc>2   2gt
nnoremap <esc>3   3gt
nnoremap <esc>4   4gt
nnoremap <esc>5   5gt
nnoremap <esc>6   6gt
nnoremap <esc>7   7gt
nnoremap <esc>8   8gt
nnoremap <esc>9   9gt

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

" gundo.vim
let g:gundo_right = 1
nnoremap <leader>g :GundoToggle<CR>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-indent-guides
nmap <leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0
autocmd VimEnter,Colorscheme *
\ if &softtabstop < 4                           |
\   highlight IndentGuidesOdd  ctermbg=NONE     |
\   highlight IndentGuidesEven ctermbg=black    |
\ else                                          |
\   let g:indent_guides_guide_size = 1          |
\   highlight IndentGuidesOdd  ctermbg=black    |
\   highlight IndentGuidesEven ctermbg=black    |
\ endif

" vim-better-whitespace
let g:strip_whitespace_on_save = 1

" vim-javascript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
