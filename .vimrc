call pathogen#infect()

filetype plugin indent on
syntax on

set number
set noantialias
set modeline
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#242424

let g:session_autosave = 'yes'
let mapleader = ','

colorscheme molokai

if has('gui_running')
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
  set background=dark
  set guifont=Monaco:h10
endif
