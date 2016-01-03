"
" General configs
"
set shell=/bin/bash " http://stackoverflow.com/a/12231417
set diffopt+=iwhite,vertical
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set startofline
set splitbelow
set nobackup
set nocompatible
set nofoldenable
set noshowmode
set noswapfile
set nowrap

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
au BufRead,BufNewFile .{eslintrc,babelrc} setf json


"
" Key mappings
"
let g:mapleader = ","

" Easy command-line mode
nnoremap ; :
" Easy delete key
vnoremap <backspace> "_d
" Easy newline insert
nnoremap <CR> o<Esc>
" Easy file save
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
vnoremap <silent> <C-s> <ESC>:update<CR>gv
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
" Tab navigations (neovim)
nnoremap <a-t> :tabnew<CR>
nnoremap <a-1> 1gt
nnoremap <a-2> 2gt
nnoremap <a-3> 3gt
nnoremap <a-4> 4gt
nnoremap <a-5> 5gt
nnoremap <a-6> 6gt
nnoremap <a-7> 7gt
nnoremap <a-8> 8gt
nnoremap <a-9> 9gt

" define a group `vimrc` and initialize.
augroup vimrc
  autocmd!
augroup END


"
" Plugins
"
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-xmark'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-rfc'
Plug '~/.racer/racer', { 'for': 'rust' }
Plug 'vim-utils/vim-interruptless'

" Visual
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/seoul256.vim'

" Syntax
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'tikhomirov/vim-glsl'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'vim-scripts/applescript.vim'
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
Plug 'brk3/groovyindent'
Plug 'tmux-plugins/vim-tmux'
Plug 'rhysd/vim-crystal'
Plug 'rgrinberg/vim-ocaml'
Plug 'simnalamburt/k-.vim'
Plug 'wlangstroth/vim-racket'
Plug 'leafgarland/typescript-vim'
Plug 'dag/vim-fish'

" Blink
Plug 'rhysd/clever-f.vim'
Plug 'Lokaltog/vim-easymotion'

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

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1

" vim-indent-guides
nmap <leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0

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
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


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

  " Listchars for whitespaces
  highlight NonText    ctermfg=darkblue
  highlight SpecialKey ctermfg=darkblue
  " Pair matching
  highlight MatchParen ctermfg=226 ctermbg=016
endfunction
call <SID>beauty()

" indention
function! s:indent()
  if &softtabstop < 4
    highlight IndentGuidesOdd ctermbg=NONE
  else
    let g:indent_guides_guide_size = 1
    highlight IndentGuidesOdd ctermbg=black
    execute printf("highlight IndentGuidesOdd ctermbg=%d", s:back_color)
  endif
  execute printf("highlight IndentGuidesEven ctermbg=%d", s:back_color)

  if &tabstop < 4
    " Do not decorate tab with '›' when tabstop is small
    set listchars=tab:\ \ ,extends:»,precedes:«
  else
    set listchars=tab:›\ ,extends:»,precedes:«
  endif
endfunction
autocmd! vimrc VimEnter,Colorscheme * call <SID>indent()
