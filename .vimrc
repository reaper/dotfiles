call pathogen#infect()

filetype plugin indent on
syntax on

set nu
set expandtab
set noantialias
set modeline
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

colorscheme molokai

if has('gui_running')
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
  set background=dark
  set guifont=Monaco:h10
endif
