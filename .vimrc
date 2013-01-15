set nocompatible "Change VIM behavior
set number "Display line numbers
set hlsearch "Do highlight searches
set incsearch "Do incremental searches
set nofoldenable "Do not fold file content
set showmatch "Set show matching parenthesis
set tabstop=2 "Tab stop set to 2
set shiftwidth=2 "Shif width set to 2
set history=20 "Set history to 20
set wildignore=*.swp,*.bak,*.pyc,*.class "Set ignored files
set nobackup "Don't do backup
set noswapfile "Don't create swap files
set expandtab "Replace tabs with spaces

colorscheme molokai "Use molokai colorscheme

call pathogen#infect() "Enable pathogen

"Enable plugins and syntax
filetype on "Enable filetype
filetype plugin on "Enable plugins
filetype indent on "Enable indenting
syntax on "Enable syntax

"Indentation
let g:indent_guides_guide_size=1 "Indentation size set to 1
let g:indent_guides_auto_colors=0 "Indentation auto color set to 0
let g:indent_guides_enable_on_vim_startup=1 "Enable indentation plugin
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 "Load Odd color for indentation
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#242424 "Load Even color for indentation

" Filetypes
au BufNewFile,BufRead *.per setlocal filetype=per
au BufNewFile,BufRead SConstruct,SConscript,SConscript.* setlocal filetype=scons

" Undo persistence && GUndo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
let g:gundo_width = 60
let g:gundo_preview_height = 40
nnoremap <F5> :GundoToggle<CR>

"Session
let g:session_autosave='yes' "Save automatically session
let mapleader=',' "Change mapleader bind key to ','

"Tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=30                          " Default is 40

"Enable doxygen syntax
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_compactDoc="yes"
let g:DoxygenToolkit_authorName="Pierre FILSTROFF <pfilstroff@gmail.com>"

"Tags
set tags+=~/.vim/tags/cpp "Include cpp tags
set tags+=~/.vim/tags/qt4 "Include qt4 tags
map <C-F12> :!/usr/local/bin/ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"OmniCppComplete
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " show function parameters
let OmniCpp_MayCompleteDot=1 " autocomplete after .
let OmniCpp_MayCompleteArrow=1 " autocomplete after ->
let OmniCpp_MayCompleteScope=1 " autocomplete after ::
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"NERDTREE
let NERDTreeIgnore = ['^moc_*', '\.o', '\.os', '\.a', '\.la', '\.dylib', '\.42f', '\.42m', '\.42r']

"Macvim configuration
if has('gui_running')
    autocmd VimEnter * NERDTree "Load NERDTREE plugin
    autocmd VimEnter * wincmd p "Load current path for NERDTREE
    autocmd VimEnter * TagbarToggle "Load Tagbar
    set background=dark "Set background
    set guifont=Monaco:h10 "Set font famility
    set noantialias "Set no anti aliasing
endif

"FOURJS configuration
autocmd BufRead,BufNewFile *.xhtml,*.css,*.js set expandtab!
