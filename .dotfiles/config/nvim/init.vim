call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'szw/vim-maximizer'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tacahiroy/ctrlp-funky'

" Colorscheme
Plug 'tomasr/molokai'

" Add plugins to &runtimepath
call plug#end()

let mapleader = ","

syntax on
filetype plugin indent on

colorscheme molokai

nnoremap <C-S-Up> :wincmd k<CR>
nnoremap <C-S-Down> :wincmd j<CR>
nnoremap <C-S-Left> :wincmd h<CR>
nnoremap <C-S-Right> :wincmd l<CR>


" Nerdtree
" ========
map <silent> <C-n> :NERDTreeToggle<CR>


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
