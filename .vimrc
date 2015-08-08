"
" General configs
"
set enc=utf-8
set backspace=indent,eol,start
set diffopt+=iwhite,vertical
set laststatus=2
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set ruler
set startofline
set splitbelow
set nobackup
set nocompatible
set nofoldenable
set noshowmode
set noswapfile
set nowrap

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


"
" Key mappings
"
let g:mapleader = ","

" Easy command-line mode
nnoremap ; :
" Easy newline insert
nnoremap <CR> o<Esc>
" Easy file save
nnoremap <silent> S :update<CR>
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
nnoremap <esc>t :tabnew<CR>
nnoremap <esc>1 1gt
nnoremap <esc>2 2gt
nnoremap <esc>3 3gt
nnoremap <esc>4 4gt
nnoremap <esc>5 5gt
nnoremap <esc>6 6gt
nnoremap <esc>7 7gt
nnoremap <esc>8 8gt
nnoremap <esc>9 9gt

" define a group `vimrc` and initialize.
augroup vimrc
  autocmd!
augroup END


"
" Plugins
"
call plug#begin('~/.vim/plugged')

" Beauty
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'

" Syntax
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'tikhomirov/vim-glsl'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'mhinz/vim-rfc'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }

" General
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/vim-github-dashboard'
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug '~/.racer/racer', { 'for': 'rust' }

" Blink
Plug 'rhysd/clever-f.vim'
Plug 'Lokaltog/vim-easymotion'

call plug#end()

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" vim-indent-guides
nmap <leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0
autocmd vimrc VimEnter,Colorscheme *
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

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" gundo.vim
let g:gundo_right = 1
nnoremap <leader>g :GundoToggle<CR>

" vim-github-dashboard
let g:github_dashboard = { 'username': 'simnalamburt' }

" racer
set hidden
let g:racer_cmd = "~/.racer/racer/target/release/racer"
let $RUST_SRC_PATH=$HOME."/.racer/rust/src"
inoremap <C-o> <C-x><C-o>

" clever-f.vim
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1

" vim-easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


"
" Beutiful vim
"
filetype plugin indent on
colorscheme elflord

function! s:beauty()
  syntax on

  " Line number column
  set number
  set cursorline
  highlight LineNr ctermbg=black
  highlight CursorLine cterm=none
  highlight CursorLineNr ctermfg=white ctermbg=black

  " Split bar
  highlight VertSplit ctermfg=234 ctermbg=234

  " Listchars for whitespaces
  set list
  highlight NonText    ctermfg=darkblue
  highlight SpecialKey ctermfg=darkblue

  " 80th column layout concerns
  set textwidth=80
  set colorcolumn=+1,+2,+3
  highlight ColorColumn ctermbg=black

  " Pair matching
  set matchpairs+=<:>
  set showmatch
  highlight MatchParen ctermfg=white ctermbg=016

  " Wildmenu settings
  set wildmenu
  set wildmode=full
  highlight StatusLine ctermbg=darkgray ctermfg=234
  highlight WildMenu   ctermfg=white    ctermbg=234

  " Better diff
  set fillchars+=vert:\ ,fold:―,diff:·
  highlight DiffAdd    ctermfg=040  ctermbg=none
  highlight DiffDelete ctermfg=052  ctermbg=none
  highlight DiffChange ctermfg=none ctermbg=none
  highlight DiffText   ctermfg=027  ctermbg=none
  highlight Folded     ctermfg=016  ctermbg=none
endfunction
call s:beauty()

" Don't user listchars for tab when tabstop is small
autocmd vimrc VimEnter,Colorscheme *
\ if &tabstop < 4                               |
\   set listchars=tab:\ \ ,extends:»,precedes:« |
\ else                                          |
\   set listchars=tab:›\ ,extends:»,precedes:«  |
\ endif

" Use different colorscheme in vimdiff
autocmd vimrc FilterWritePre *
\ if &diff                                      |
\   syntax off                                  |
\   set foldcolumn=0                            |
\ endif

" Restore colorscheme on BufWinLeave
autocmd vimrc BufWinLeave *
\ if &diff                                      |
\   call s:beauty()                             |
\   call airline#load_theme()                   |
\   call airline#update_statusline()            |
\ endif
