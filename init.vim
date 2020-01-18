" VSCode neovim extension config. Subset of '.vimrc'
if exists('g:vscode')
  " General configs
  set pastetoggle=<F8>
  set startofline
  set splitbelow

  " Searching
  set incsearch
  set ignorecase
  set smartcase
  set hlsearch | nohlsearch
  set nowrapscan

  " 80th column color
  set textwidth=80
  set formatoptions-=t
  if v:version >= 703
    set colorcolumn=+1,+2,+3
  endif

  "
  " Key mappings
  "
  let g:mapleader = ","

  " Easy file save without switching IME
  cabbrev ㅈ Write
  cabbrev ㅂ Quit
  cabbrev ㅈㅂ Wq

  " Easy command-line mode
  nnoremap ; :
  " Easy home/end
  inoremap <C-a> <ESC>I
  inoremap <C-e> <End>
  nnoremap <C-a> ^
  nnoremap <C-e> $
  vnoremap <C-a> ^
  vnoremap <C-e> $
  " Easy delete key
  vnoremap <backspace> "_d

  " Easy indentation
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv

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
endif
