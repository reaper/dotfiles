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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tacahiroy/ctrlp-funky'
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
Plug 'nathanaelkane/vim-indent-guides'
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Colorscheme
Plug 'morhetz/gruvbox'

" Add plugins to &runtimepath
call plug#end()

"Use colorscheme gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

set cursorline
set nu
set number relativenumber
set nowrap
set nocompatible      " We're running Vim, not Vi!
set nobackup
set noswapfile
set lazyredraw
set mouse=a
set clipboard+=unnamedplus

" Paste with middle mouse click
vmap <LeftRelease> "*ygv

" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*

if has("gui_running")
  call GuiClipboard()
endif

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

let mapleader = ","

syntax on
filetype plugin indent on

" Vim undo create dir if not existing
if !isdirectory("~/.nvim/undo")
  silent !mkdir ~/.nvim/undo > /dev/null 2>&1
endif

set undofile
set undodir=~/.nvim/undo
set undolevels=1000
set undoreload=10000
set background=dark
set guifont=DejaVu\ Sans\ Mono:h11

set autoread
au FocusGained,BufEnter * :checktime

nnoremap <C-S-Up> :wincmd k<CR>
nnoremap <C-S-Down> :wincmd j<CR>
nnoremap <C-S-Left> :wincmd h<CR>
nnoremap <C-S-Right> :wincmd l<CR>


" Nerdtree
" ========
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
map <silent> <C-n> :NERDTreeToggle %<CR>
map <silent> <C-r> :NERDTreeFocus<cr> \| R \| <c-w><c-p>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0

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

" VimSession
let g:session_autosave = "yes"

" IndentGuides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" GitGutter
let g:gitgutter_enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Markdown
let g:vim_markdown_folding_disabled = 1


