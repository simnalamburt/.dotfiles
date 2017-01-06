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
" Tab navigations
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
  set renderoptions=type:directx

  " Use msys2 configs if does exist
  if isdirectory('C:\msys64')
    let $PATH = 'C:\msys64\usr\bin;'.$PATH
    let &runtimepath = 'C:\msys64\home\'.$USERNAME.'\.vim,'.&runtimepath
    let s:plug = 'C:\msys64\home\'.$USERNAME.'\.vim\plugged'
  endif
endif


"
" Plugins
"
try | call plug#begin(exists('s:plug') ? s:plug : '~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if !has('win32') && !has('win64') && !has('win32unix')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
endif
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
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
Plug 'justinmk/vim-dirvish'

" Haskell
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'

" Visual
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
if has('python') || has('python3')
  Plug 'editorconfig/editorconfig-vim'
endif
Plug 'junegunn/seoul256.vim'

" Syntax
Plug 'vim-scripts/applescript.vim'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
Plug 'simnalamburt/k-.vim'
Plug 'wlangstroth/vim-racket'
Plug 'tfnico/vim-gradle'
Plug 'wavded/vim-stylus'
Plug 'elixir-lang/vim-elixir'
Plug 'idris-hackers/idris-vim'
Plug 'Superbil/llvm.vim'

Plug 'sheerun/vim-polyglot'

" Blink
Plug 'rhysd/clever-f.vim'
Plug 'Lokaltog/vim-easymotion'

call plug#end() | catch /^Vim\%((\a\+)\)\=:E117/ | echo 'No vim-plug' | endtry


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
let g:indent_guides_exclude_filetypes = ['help', 'startify']
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

" elm-vim
let g:elm_format_autosave = 1

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

" Reference: https://github.com/junegunn/seoul256.vim/blob/master/colors/seoul256.vim
if !exists('s:rgb_map')
  let s:rgb_map = {
  \ 'NONE': 'NONE',
  \ 'white': '#FFFFFF', 'black': '#191919',
  \ 'darkblue': '#0000BF', 'darkgray': '#6C6C6C',
  \  16: '#000000',
  \  22: '#006F00', 23: '#007173', 24: '#007299', 25: '#0074BE', 30: '#009799',
  \  31: '#0099BD', 38: '#00BDDF', 52: '#730B00', 58: '#727100', 59: '#727272',
  \  65: '#719872', 66: '#719899', 67: '#7299BC', 68: '#719CDF', 73: '#6FBCBD',
  \  74: '#70BDDF', 88: '#9B1300', 89: '#9B1D72', 94: '#9A7200', 95: '#9A7372',
  \  96: '#9A7599', 101: '#999872', 103: '#999ABD', 108: '#98BC99', 109: '#98BCBD',
  \ 110: '#98BEDE', 116: '#97DDDF', 125: '#BF2172', 131: '#BE7572', 137: '#BE9873',
  \ 143: '#BDBB72', 144: '#BDBC98', 145: '#BDBDBD', 151: '#BCDDBD', 152: '#BCDEDE',
  \ 153: '#BCE0FF', 161: '#E12672', 168: '#E17899', 173: '#E19972', 174: '#E09B99',
  \ 179: '#DFBC72', 181: '#E0BEBC', 184: '#DEDC00', 186: '#DEDD99', 187: '#DFDEBD',
  \ 189: '#DFDFFF', 216: '#FFBD98', 217: '#FFBFBD', 218: '#FFC0DE', 220: '#FFDD00',
  \ 222: '#FFDE99', 224: '#FFDFDF', 226: '#FFFF00',
  \ 230: '#FFFFDF', 231: '#FFFFFF', 232: '#060606',
  \ 233: '#171717', 234: '#252525', 235: '#333233', 236: '#3F3F3F', 237: '#4B4B4B',
  \ 238: '#565656', 239: '#616161', 240: '#6B6B6B', 241: '#757575', 249: '#BFBFBF',
  \ 250: '#C8C8C8', 251: '#D1D0D1', 252: '#D9D9D9', 253: '#E1E1E1', 254: '#E9E9E9',
  \ 255: '#F1F1F1' }
endif
function! s:rs(item)
  execute printf("highlight %s cterm=NONE gui=NONE", a:item)
endfunction
function! s:fg(item, color)
  execute printf("highlight %s ctermfg=%s guifg=%s", a:item, a:color, get(s:rgb_map, a:color))
endfunction
function! s:bg(item, color)
  execute printf("highlight %s ctermbg=%s guibg=%s", a:item, a:color, get(s:rgb_map, a:color))
endfunction

function! s:beauty()
  syntax enable

  call s:rs('CursorLine')
  call s:bg('CursorLine',   'NONE')
  call s:bg('CursorLineNr', s:back_color)
  call s:bg('LineNr',       s:back_color)
  call s:bg('ColorColumn',  s:back_color)
  call s:fg('VertSplit',    s:back_color)
  call s:bg('VertSplit',    s:back_color)

  " Status line, Tab line
  call s:fg('StatusLine',   s:back_color)
  call s:bg('StatusLine',   'darkgray')
  call s:fg('WildMenu',     'white')
  call s:bg('WildMenu',     s:back_color)
  call s:rs('TabLine')
  call s:fg('TabLine',      'darkgray')
  call s:bg('TabLine',      s:back_color)
  call s:rs('TabLineSel')
  call s:fg('TabLineSel',   'white')
  call s:bg('TabLineSel',   s:back_color)
  call s:fg('TabLineFill',  s:back_color)
  call s:bg('TabLineFill',  s:back_color)

  " vimdiff
  call s:bg('DiffChange',   'NONE')
  call s:bg('DiffText',     22)
  call s:bg('DiffAdd',      22)
  call s:fg('DiffDelete',   235)
  call s:bg('DiffDelete',   'NONE')

  " Listchars for whitespaces
  call s:fg('NonText',      'darkblue')
  call s:fg('SpecialKey',   'darkblue')
  " Pair matching
  call s:fg('MatchParen',   226)
  call s:bg('MatchParen',   16)
endfunction
autocmd vimrc ColorScheme * call <SID>beauty()

" indentation
function! s:indent()
  if &softtabstop < 4 || !&expandtab
    call s:bg('IndentGuidesOdd', 'NONE')
  else
    let g:indent_guides_guide_size = 1
    call s:bg('IndentGuidesOdd', s:back_color)
  endif
  call s:bg('IndentGuidesEven', s:back_color)

  " Do not decorate tab with '›' when tabstop is small
  if &tabstop <= 4
    let &listchars = "tab:\ \ ,extends:\u00BB,precedes:\u00AB"
  else
    let &listchars = "tab:\u203A\ ,extends:\u00BB,precedes:\u00AB"
  endif
endfunction
autocmd vimrc VimEnter,Colorscheme * call <SID>indent()
