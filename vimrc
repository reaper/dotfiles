call pathogen#infect() "Enable pathogen

set nocompatible "Change VIM behavior
set number "Display line numbers
set hlsearch "Do highlight searches
set incsearch "Do incremental searches
set nofoldenable "Do not fold file content
set showmatch "Set show matching parenthesis
set history=20 "Set history to 20
set wildignore=*.swp,*.bak,*.pyc,*.class "Set ignored files
set nobackup "Don't do backup
set noswapfile "Don't create swap files
set expandtab "Replace tabs with spaces
set tabstop=2 "Default tabstop
set shiftwidth=2 "Default shiftwidth

" Enable plugins and syntax
filetype on "Enable filetype
filetype plugin on "Enable plugins
filetype indent on "Enable indenting
syntax on "Enable syntax

" Indentation
let g:indent_guides_guide_size=1 "Indentation size set to 1
let g:indent_guides_auto_colors=0 "Indentation auto color set to 0
let g:indent_guides_enable_on_vim_startup=1 "Enable indentation plugin
au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1A1A1A "Load Odd color for indentation
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#171717 "Load Even color for indentation

" Filetypes
au BufNewFile,BufRead *.per setlocal filetype=per
au BufNewFile,BufRead SConstruct,SConscript*,*.py setlocal filetype=python
au BufNewFile,BufRead *.xhtml,*.css,*.js set expandtab!
au FileType ruby compiler ruby

" Syntastic
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" Undo persistence && GUndo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
let g:gundo_width = 60
let g:gundo_preview_height = 40

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Session
let g:session_autosave='yes' "Save automatically session

" Mapleader
let mapleader=',' "Change mapleader bind key to ','

" Tagbar
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
  else
    let g:tagbar_ctags_bin='/usr/bin/ctags'  " Proper Ctags locations
  endif
endif
let g:tagbar_width=30                          " Default is 40

" Enable doxygen syntax
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_compactDoc="yes"
let g:DoxygenToolkit_authorName="Pierre FILSTROFF <pfilstroff@gmail.com>"

" Tags
set tags+=~/.vim/tags/cpp "Include cpp tags
set tags+=~/.vim/tags/qt4 "Include qt4 tags

" Key mappings
nnoremap <F5> :GundoToggle<CR>
nnoremap <C-F12> :!/usr/local/bin/ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    nnoremap <silent> <C-f> :FufCoverageFile<CR>
    nnoremap <silent> <S-D-Left> :NERDTreeToggle<CR>
    nnoremap <silent> <S-D-Right> :NERDTreeToggle<CR>
    nnoremap <silent> <M-D-Right> <c-w>l
    nnoremap <silent> <M-D-Left> <c-w>h
    nnoremap <silent> <M-D-Up> <c-w>k
    nnoremap <silent> <M-D-Down> <c-w>j
  else
    nnoremap <silent> <C-f> :FufCoverageFile<CR>
    nnoremap <silent> <S-A-Left> :NERDTreeToggle<CR>
    nnoremap <silent> <S-A-Right> :NERDTreeToggle<CR>
    nnoremap <silent> <S-C-Right> <c-w>l
    nnoremap <silent> <S-C-Left> <c-w>h
    nnoremap <silent> <S-C-Up> <c-w>k
    nnoremap <silent> <S-C-Down> <c-w>j
  endif
endif


" NERDTREE
let NERDTreeIgnore = ['^moc_*', '\.o', '\.os', '\.a', '\.la', '\.dylib', '\.42f', '\.42m', '\.42r']

" JellyBeans colorscheme configuration
" let g:jellybeans_background_color = "000000"
colorscheme jellybeans "Use jellybeans colorscheme

" Typo configuration
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Monaco:h10 "Set font family
  else
    set guifont=Ubuntu\ Mono\ 11
  endif
endif
set noantialias "Set no anti aliasing

" GUI configuration
if has('gui_running')
    autocmd VimEnter * TagbarToggle "Load Tagbar
endif

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

set rnu "Relative number
