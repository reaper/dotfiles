set nocompatible "Change VIM behavior
set number "Display line numbers
set hlsearch "Do highlight searches
set incsearch "Do incremental searches
set nofoldenable "Do not fold file content
set tabstop=4 "Tab stop set to 4
set shiftwidth=4 "Shif width set to 4
set showmatch "Set show matching parenthesis
set history=20 "Set history to 20
set undolevels=100 "Undo levels
set wildignore=*.swp,*.bak,*.pyc,*.class "Set ignored files
set nobackup "Don't do backup
set noswapfile "Don't create swap files

colorscheme molokai "Use molokai colorscheme

call pathogen#infect() "Enable pathogen

filetype on "Enable filetype
filetype plugin on "Enable plugins
filetype indent on "Enable indenting
syntax on "Enable syntax

let g:indent_guides_guide_size=1 "Indentation size set to 1
let g:indent_guides_auto_colors=0 "Indentation auto color set to 0
let g:indent_guides_enable_on_vim_startup=1 "Enable indentation plugin
let g:session_autosave='yes' "Save automatically session
let mapleader=',' "Change mapleader bind key to ','
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 "Load Odd color for indentation
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#242424 "Load Even color for indentation

"_MACVIM configuration
if has('gui_macvim')
  autocmd VimEnter * NERDTree "Load NERDTREE plugin
  autocmd VimEnter * wincmd p "Load current path for NERDTREE
  autocmd VimEnter * TagbarToggle "Load Tagbar
  set background=dark "Set background
  set guifont=Monaco:h10 "Set font famility
  set noantialias "Set no anti aliasing
endif
