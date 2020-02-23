" Require Vim 7.3+
" See https://github.com/simnalamburt/.dotfiles/blob/master/.vimrc

"
" General configs
"
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp949,default,latin1
set shell=/bin/bash " http://stackoverflow.com/a/12231417
set diffopt+=iwhite,vertical
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set startofline
set splitbelow
set lazyredraw
set nobackup
set nocompatible
set nofoldenable
set noshowmode
set noswapfile
set nowrap
set updatetime=500

" History
if has("persistent_undo")
  " mkdir -p ~/.vim/undodir
  let vimdir = '$HOME/.vim'
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

" Tab
set softtabstop=2
set shiftwidth=2
set expandtab

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch | nohlsearch
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


"
" Key mappings
"
let g:mapleader = ","

" Easy file save without switching IME
cabbrev ㅈ w
cabbrev ㅂ q
cabbrev ㅈㅂ wq

" Easy command-line mode
nnoremap ; :
" Easy home/end
inoremap <C-a> <ESC>I
inoremap <C-e> <End>
nnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-a> ^
vnoremap <C-e> $
" Easy horizontal scrolling
noremap <esc>l 3zl
noremap <esc>h 3zh
" Easy delete key
vnoremap <backspace> "_d
" Easy file save
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
vnoremap <silent> <C-s> <ESC>:update<CR>
" Easy indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Easy splitting & resizing
nnoremap <silent> <esc>- :split<CR>
nnoremap <silent> <esc>\ :vertical split<CR>
nnoremap <silent> <esc>h :vertical resize -5<CR>
nnoremap <silent> <esc>j :resize -3<CR>
nnoremap <silent> <esc>k :resize +3<CR>
nnoremap <silent> <esc>l :vertical resize +5<CR>
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

" Easy newline insert
function! CustomEnter()
  if &modifiable
    normal! o
  else
    " Exception for quickfix buffer and other unmodifiable buffers.
    " See https://vi.stackexchange.com/a/3129
    execute "normal! \<CR>"
  endif
endfunction
nnoremap <CR> :call CustomEnter()<CR>


"
" List of plugins
"
try
  call plug#begin(exists('s:plug') ? s:plug : '~/.vim/plugged')

  " Configs
  Plug 'tpope/vim-sensible'
  Plug 'vim-utils/vim-interruptless'

  " Visual
  Plug 'vim-airline/vim-airline'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'junegunn/seoul256.vim'

  " Syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'boeckmann/vim-freepascal'
  Plug 'hashivim/vim-terraform'

  " Format
  if executable('yarn')
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql'] }
  endif
  Plug 'sgur/vim-editorconfig'

  " Blink
  Plug 'farmergreg/vim-lastplace'
  Plug 'rhysd/clever-f.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'

  " Util
  Plug 'simnalamburt/vim-mundo'
  Plug 'tpope/vim-endwise'
  Plug 'godlygeek/tabular'
  Plug 'justinmk/vim-dirvish'

  call plug#end()

  let s:has_vimplug = 1
catch /^Vim\%((\a\+)\)\=:E117/
endtry


"
" Configs for plugins
"
if exists('s:has_vimplug') && s:has_vimplug
  " vim-indent-guides
  nmap <leader>i <Plug>IndentGuidesToggle
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_start_level = 2
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['help']
  let g:indent_guides_default_mapping = 0

  " vim-polyglot
  let g:polyglot_disabled = ['systemd', 'python']
  let g:vue_disable_pre_processors=1

  " vim-terraform
  let g:terraform_fmt_on_save=1

  " vim-prettier
  let g:prettier#autoformat_config_present = 1
  let g:prettier#autoformat_require_pragma = 0
  let g:prettier#exec_cmd_async = 1
  let g:prettier#quickfix_enabled = 0

  " clever-f.vim
  let g:clever_f_across_no_line = 1
  let g:clever_f_smart_case = 1

  " incsearch.vim
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

  " incsearch-easymotion.vim
  function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
    \   'converters': [incsearch#config#fuzzy#converter()],
    \   'modules': [incsearch#config#easymotion#module()],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

  " mundo.vim
  let g:mundo_right = 1
  nnoremap <leader>g :MundoToggle<CR>
endif


"
" Beutiful vim
"
let g:seoul256_background = 233
try
  colorscheme seoul256
catch /^Vim\%((\a\+)\)\=:E185/
  " Fallback
  silent! colorscheme elflord
endtry
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
  \ 153: '#BCE0FF', 160: '#D70000',
  \ 161: '#E12672', 168: '#E17899', 173: '#E19972', 174: '#E09B99',
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

" Beauty vimdiff colorscheme
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

" Indentation
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

" Extra whitespaces
call s:bg('ExtraWhitespace', 160)


"
" Define a 'vimrc' augroup
"
augroup vimrc
  autocmd!

  " Indentation setting for Golang
  autocmd BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8

  " Treat .eslintrc .babelrc as json
  autocmd BufRead,BufNewFile .{eslintrc,babelrc,swcrc} setf json

  " vim-vue
  autocmd FileType vue syntax sync fromstart

  " Vim automatic reload
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END


"
" Local configs
"
if filereadable($HOME . '/.vimrc.local')
  source $HOME/.vimrc.local
endif
