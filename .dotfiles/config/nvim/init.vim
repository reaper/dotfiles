call plug#begin('~/.nvim/plugged')

" Plugins
Plug 'szw/vim-maximizer'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-ruby/vim-ruby'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'elzr/vim-json'
Plug 'tpope/vim-sensible'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-bundler'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-rake'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'equalsraf/neovim-gui-shim'
Plug 'ervandew/supertab'
Plug 'leafgarland/typescript-vim'
Plug 'Shadowsith/vim-ruby-autocomplete'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.nvim/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'tag': '5.1', 'do': ':UpdateRemotePlugins' }
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'

" Colorscheme
Plug 'morhetz/gruvbox'

" Add plugins to &runtimepath
call plug#end()

"Use colorscheme gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set nu                "set number relativenumber difficult for pair programing
set nowrap
set nocompatible      " We're running Vim, not Vi!
set mouse=a
set clipboard+=unnamedplus
set re=1 " ruby regexp engine version to 1 more perf
set lazyredraw
set ttyfast
set cursorline
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Paste with middle mouse click
vmap <LeftRelease> "*ygv

" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*

if has("gui_running")
  call GuiClipboard()
endif


let mapleader = ","

" Vim undo create dir if not existing
if !isdirectory("~/.nvim/undo")
  silent !mkdir ~/.nvim/undo > /dev/null 2>&1
endif

set undofile
set undodir=~/.nvim/undo
set undolevels=1000
set undoreload=10000
set background=dark

if has('macunix')
  set guifont=Hack:h10
else
  set guifont=DejaVu\ Sans\ Mono:h11
endif

au FocusGained,BufEnter,CursorHold * :checktime

nnoremap <C-S-Up> :wincmd k<CR>
nnoremap <C-S-Down> :wincmd j<CR>
nnoremap <C-S-Left> :wincmd h<CR>
nnoremap <C-S-Right> :wincmd l<CR>


" Nerdtree
" ========
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
au FocusGained * :NERDTreeRefreshRoot
map <silent> <C-n> :NERDTreeToggle %<CR>
"map <silent> <C-r> :NERDTreeFocus<cr> \| R \| <c-w><c-p>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0

" Tagbar
autocmd VimEnter * TagbarToggle

" ARB syntax highlight
" ====================
autocmd BufRead,BufNewFile *.arb setfiletype ruby

" Javacomplete2
" =============
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" To enable smart (trying to guess import option) inserting class imports with F4, add:
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

"To enable usual (will ask for import option) inserting class imports with F5, add:
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

"To add all missing imports with F6:
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

"To remove all missing imports with F7:
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


" CtrlPFunky
" ==========
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" VimIndent
set ts=2 sw=2 et

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" GitGutter
let g:gitgutter_enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Markdown
let g:vim_markdown_folding_disabled = 1

" VimSession
let g:session_lock_enabled = 0
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" FZF
execute "nnoremap <C-p> :Files " . getcwd() . "<Cr>"

" Better Whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=

" Toggle maximize
map <silent> <C-m> :MaximizerToggle<CR>

" Ruby
let g:ruby_default_path=system("which ruby")

" Ale
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
