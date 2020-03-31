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
set nowritebackup
set nocompatible
set nofoldenable
set noshowmode
set noswapfile
set nowrap
set updatetime=500

" History
if has('persistent_undo')
  set undofile
  let &undodir = $HOME . '/.vim/undodir'
  silent! call mkdir(&undodir, 'p')
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
let &listchars = 'tab:› ,extends:»,precedes:«'
" Pair matching
set matchpairs+=<:>
set showmatch
" Wildmenu
set wildmode=longest,full

" Completion
set hidden
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set signcolumn=yes


"
" Key mappings
"
let g:mapleader = ','

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
function! s:CustomEnter()
  if &modifiable
    normal! o
  else
    " Exception for quickfix buffer and other unmodifiable buffers.
    " See https://vi.stackexchange.com/a/3129
    execute 'normal! \<CR>'
  endif
endfunction
nnoremap <CR> :call <SID>CustomEnter()<CR>


"
" List of plugins
"
try
  call plug#begin(exists('s:plug') ? s:plug : '~/.vim/plugged')

  " Configs
  Plug 'tpope/vim-sensible'
  Plug 'vim-utils/vim-interruptless'

  " IDE
  if v:version >= 800
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'mattn/vim-lsp-settings'
    Plug 'junegunn/fzf'
  endif
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Visual
  Plug 'vim-airline/vim-airline'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'junegunn/seoul256.vim'

  " Syntax
  let g:polyglot_disabled = ['v'] | Plug 'sheerun/vim-polyglot'
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
  Plug 'haya14busa/incsearch-easymotion.vim'

  " Util
  Plug 'simnalamburt/vim-mundo'
  Plug 'godlygeek/tabular'
  Plug 'justinmk/vim-dirvish'

  call plug#end()


  "
  " Configs for plugins
  "

  " vim-lsp
  nnoremap <silent> K :LspHover<CR>
  nnoremap <silent> gd :rightb vsplit<CR>:LspDefinition<CR>
  nnoremap <F5> :call <SID>lsp_menu()<CR>
  autocmd CursorMoved * call s:auto_close_preview()
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_preview_doubletap = [function('lsp#ui#vim#output#closepreview')]
  let g:lsp_signs_error = {'text': '🚨'}
  let g:lsp_signs_warning = {'text': '🤔'}
  let g:lsp_signs_information = {'text': '👀'}
  let g:lsp_signs_hint = {'text': '💁'}

  let s:cursor_counter = 0

  function! s:auto_close_preview()
    if !s:have_preview()
      return
    endif

    let s:cursor_counter += 1

    if s:cursor_counter >= 2
      call lsp#ui#vim#output#closepreview()
      let s:cursor_counter = 0
    endif
  endfunction

  function! s:have_preview()
    for nr in range(1, winnr('$'))
      if getwinvar(nr, '&pvw') == 1
        return 1
      endif
    endfor
    return 0
  endfunction

  function! s:lsp_menu()
    call fzf#run({
    \ 'source': [
    \   'Rename',
    \   'Definition',
    \   'Declaration',
    \   'References',
    \   'Implementation',
    \   'CodeAction',
    \   'Hover',
    \   'Status',
    \
    \   'DocumentDiagnostics',
    \   'DocumentFold',
    \   'DocumentFormat',
    \   'DocumentRangeFormat',
    \   'DocumentSymbol',
    \   'NextDiagnostic',
    \   'NextError',
    \   'NextReference',
    \   'NextWarning',
    \   'PeekDeclaration',
    \   'PeekDefinition',
    \   'PeekImplementation',
    \   'PeekTypeDefinition',
    \   'PreviousDiagnostic',
    \   'PreviousError',
    \   'PreviousReference',
    \   'PreviousWarning',
    \   'SemanticScopes',
    \   'TypeDefinition',
    \   'TypeHierarchy',
    \   'WorkspaceSymbol',
    \   'StopServer',
    \ ],
    \ 'sink': function('<SID>lsp_selected'),
    \ 'options': '+m',
    \ 'down': 10 })
  endfunction

  function! s:lsp_selected(entry)
    execute printf('Lsp%s', a:entry)
  endfunction

  " asyncomplete.vim
  inoremap <expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
  inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
  inoremap <expr> <CR>    pumvisible() ? '<C-y><CR>' : '<CR>'
  inoremap <expr> <Up>    pumvisible() ? '<C-y><Up>' : '<Up>'
  inoremap <expr> <Down>  pumvisible() ? '<C-y><Down>' : '<Down>'
  let g:asyncomplete_auto_completeopt = 0

  " nerdtree
  noremap <silent> <C-n> :NERDTreeToggle<CR>
  function! s:nerdtree_startup()
    if exists('s:std_in') || argc() != 1 || !isdirectory(argv()[0])
      return
    endif
    execute 'NERDTree' argv()[0]
    wincmd p
    enew
    execute 'cd '.argv()[0]
    NERDTreeFocus
  endfunction
  augroup vimrc_nerdtree
    autocmd!

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * call s:nerdtree_startup()
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END

  " vim-indent-guides
  nmap <leader>i <Plug>IndentGuidesToggle
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_start_level = 2
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['help']
  let g:indent_guides_default_mapping = 0

  " vim-terraform
  let g:terraform_fmt_on_save=1

  " vim-prettier
  let g:prettier#autoformat_require_pragma = 0
  let g:prettier#exec_cmd_async = 1
  let g:prettier#quickfix_enabled = 0

  " clever-f.vim
  let g:clever_f_across_no_line = 1
  let g:clever_f_smart_case = 1

  " incsearch.vim
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

  " incsearch-easymotion.vim
  function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {
    \     "\<C-l>": '<Over>(easymotion)'
    \   },
    \   'is_expr': 0
    \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
  noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
  noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

  " mundo.vim
  let g:mundo_right = 1
  nnoremap <leader>g :MundoToggle<CR>
catch /^Vim\%((\a\+)\)\=:E117/
endtry


"
" My vim theme
"
let g:seoul256_background = 233
try
  colorscheme seoul256
catch /^Vim\%((\a\+)\)\=:E185/
  " Fallback
  silent! colorscheme elflord
endtry
let s:back_color = 234

function! s:rs(item)
  execute printf('highlight %s cterm=NONE', a:item)
endfunction
function! s:fg(item, color)
  execute printf('highlight %s ctermfg=%s', a:item, a:color)
endfunction
function! s:bg(item, color)
  execute printf('highlight %s ctermbg=%s', a:item, a:color)
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

" Pretty vimdiff colorscheme
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

  " Vim automatic reload
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None
augroup END


"
" Local configs
"
if filereadable($HOME . '/.vimrc.local')
  source $HOME/.vimrc.local
endif
