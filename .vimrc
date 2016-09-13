"
" General configs
"
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set shell=/bin/bash " http://stackoverflow.com/a/12231417
set diffopt+=iwhite,vertical
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set startofline
set splitbelow
set nobackup
if !has('nvim')
  set nocompatible
endif
set nofoldenable
set noshowmode
set noswapfile
set nowrap

" define a group `vimrc` and initialize.
augroup vimrc
  autocmd!
augroup END

" History
if has("persistent_undo")
  " mkdir -p ~/.vim/undodir
  let vimdir = '$HOME/.vim'
  let &runtimepath.=','.vimdir
  let vimundodir = expand(vimdir . '/undodir')
  call system('mkdir ' . vimdir)
  call system('mkdir ' . vimundodir)

  let &undodir = vimundodir
  set undofile
endif

" Indentation
set cindent
set autoindent
set smartindent
autocmd vimrc BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4 "just for go

" Tab
set softtabstop=2
set shiftwidth=2
set expandtab

" Searching
set ignorecase
set smartcase
set hlsearch
set nowrapscan

" Line number column
set number
set cursorline
" 80th column color
set textwidth=80
set formatoptions-=t
set colorcolumn=+1,+2,+3
" Listchars
set list
" Pair matching
set matchpairs+=<:>
set showmatch
" Wildmenu
set wildmode=longest,full

" Treat .eslintrc .babelrc as json
autocmd vimrc BufRead,BufNewFile .{eslintrc,babelrc} setf json


"
" Key mappings
"
let g:mapleader = ","

" Easy command-line mode
nnoremap ; :
" Easy home/end
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
nnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-a> ^
vnoremap <C-e> $
" Easy delete key
vnoremap <backspace> "_d
" Easy newline insert
nnoremap <CR> o<Esc>
" Easy file save
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
vnoremap <silent> <C-s> <ESC>:update<CR>
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
nnoremap <esc>T :-tabnew<CR>
nnoremap <esc>1 1gt
nnoremap <esc>2 2gt
nnoremap <esc>3 3gt
nnoremap <esc>4 4gt
nnoremap <esc>5 5gt
nnoremap <esc>6 6gt
nnoremap <esc>7 7gt
nnoremap <esc>8 8gt
nnoremap <esc>9 9gt
" Tab navigations (neovim)
nnoremap <a-t> :tabnew<CR>
nnoremap <a-T> :-tabnew<CR>
nnoremap <a-1> 1gt
nnoremap <a-2> 2gt
nnoremap <a-3> 3gt
nnoremap <a-4> 4gt
nnoremap <a-5> 5gt
nnoremap <a-6> 6gt
nnoremap <a-7> 7gt
nnoremap <a-8> 8gt
nnoremap <a-9> 9gt


"
" gVim (win32) only configs. Requires python 2.7
"
if has('gui_win32')
  set clipboard=unnamed
  set guioptions=
  set guifont=Consolas:h12:cANSI:qDRAFT

  " Use msys2 configs if does exist
  if isdirectory('C:\msys64')
    let $HOME = 'C:\msys64\home\admin'
    let $PATH .= ';C:\msys64\usr\bin'
  endif
endif


"
" Plugins
"
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if !has('win32') && !has('win64') && !has('win32unix')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
endif
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'
Plug 'godlygeek/tabular'
Plug '~/.racer/racer', { 'for': 'rust' }
Plug 'vim-utils/vim-interruptless'
Plug 'junegunn/gv.vim'
Plug 'rhysd/vim-grammarous'

" Haskell
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'

" Visual
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
if has('python')
  Plug 'editorconfig/editorconfig-vim'
endif
Plug 'junegunn/seoul256.vim'

" Syntax
Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/applescript.vim'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
Plug 'simnalamburt/k-.vim'
Plug 'wlangstroth/vim-racket'
Plug 'tfnico/vim-gradle'
Plug 'wavded/vim-stylus'
Plug 'elixir-lang/vim-elixir'
Plug 'idris-hackers/idris-vim'
Plug 'Superbil/llvm.vim'

" Blink
Plug 'rhysd/clever-f.vim'
Plug 'Lokaltog/vim-easymotion'

" deoplete.nvim
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'Konfekt/FastFold'

call plug#end()


" vim-airline
let g:airline_powerline_fonts = 1

" goyo.vim
function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=3
  Limelight!
  call <SID>beauty()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" limelight.vim
let g:limelight_conceal_ctermfg = 240

" vim-indent-guides
nmap <leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help']
let g:indent_guides_default_mapping = 0

" vim-better-whitespace
let g:strip_whitespace_on_save = 1

" mundo.vim
let g:mundo_right = 1
nnoremap <leader>g :MundoToggle<CR>

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
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" rhysd/vim-grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }


"
" Beutiful vim
"
try
  colorscheme seoul256
catch /^Vim\%((\a\+)\)\=:E185/
  " Fallback
  colorscheme elflord
endtry
let g:seoul256_background = 233
let s:back_color          = 234

function! s:beauty()
  syntax enable

  highlight CursorLine   cterm=none ctermbg=none
  execute printf("highlight CursorLineNr ctermbg=%d", s:back_color)
  execute printf("highlight LineNr       ctermbg=%d", s:back_color)
  execute printf("highlight ColorColumn  ctermbg=%d", s:back_color)
  execute printf("highlight VertSplit ctermfg=%d ctermbg=%d", s:back_color, s:back_color)

  " Status line, Tab line
  execute printf("highlight StatusLine  ctermbg=darkgray ctermfg=%d", s:back_color)
  execute printf("highlight WildMenu    ctermfg=white    ctermbg=%d", s:back_color)
  execute printf("highlight TabLine     ctermfg=darkgray ctermbg=%d cterm=none", s:back_color)
  execute printf("highlight TabLineSel  ctermfg=white    ctermbg=%d cterm=none", s:back_color)
  execute printf("highlight TabLineFill ctermbg=%d       ctermfg=%d", s:back_color, s:back_color)

  " vimdiff
  highlight DiffChange ctermbg=NONE
  highlight DiffText   ctermbg=22
  highlight DiffAdd    ctermbg=22
  highlight DiffDelete ctermbg=NONE ctermfg=235

  " Listchars for whitespaces
  highlight NonText    ctermfg=darkblue
  highlight SpecialKey ctermfg=darkblue
  " Pair matching
  highlight MatchParen ctermfg=226 ctermbg=016
endfunction
autocmd vimrc ColorScheme * call <SID>beauty()

" indentation
function! s:indent()
  if &softtabstop < 4 || !&expandtab
    highlight IndentGuidesOdd ctermbg=NONE
  else
    let g:indent_guides_guide_size = 1
    highlight IndentGuidesOdd ctermbg=black
    execute printf("highlight IndentGuidesOdd ctermbg=%d", s:back_color)
  endif
  execute printf("highlight IndentGuidesEven ctermbg=%d", s:back_color)

  " Do not decorate tab with '›' when tabstop is small
  if &tabstop <= 4
    let &listchars = "tab:\ \ ,extends:\u00BB,precedes:\u00AB"
  else
    let &listchars = "tab:\u203A\ ,extends:\u00BB,precedes:\u00AB"
  endif
endfunction
autocmd vimrc VimEnter,Colorscheme * call <SID>indent()
