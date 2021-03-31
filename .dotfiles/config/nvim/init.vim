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
Plug 'airblade/vim-gitgutter'
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
Plug 'leafgarland/typescript-vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.nvim/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'apple/swift', {'rtp': 'utils/vim','name': 'Swift-Syntax'}
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " require golang
Plug 'APZelos/blamer.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

" Add plugins to &runtimepath
call plug#end()

"Use colorscheme gruvbox
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = "hard"

colorscheme codedark
let g:airline_theme = 'codedark'

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
set redrawtime=10000
set wrap
set linebreak

" Paste with middle mouse click
vmap <LeftRelease> "*ygv
" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*

if has("gui_running")
  call GuiClipboard()
endif

autocmd BufEnter * :syntax sync fromstart
autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500

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

" Visual color
hi Visual guifg=White guibg=Blue gui=none
hi Visual term=reverse cterm=reverse guibg=Blue


" Visual Multi
let g:VM_theme = 'iceblue'

" Nerdtree
" ========
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
map <silent> <C-n> :NERDTreeToggle %<CR>
"map <silent> <C-r> :NERDTreeFocus<cr> \| R \| <c-w><c-p>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 0
let NERDCompactSexyComs = 1
let NERDDefaultAlign = 'left'
let NERDCommentEmptyLines = 0
let NERDTrimTrailingWhitespace = 1
let NERDSpaceDelims = 1

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

" Toggle maximize
nnoremap <silent> <Leader>m :MaximizerToggle<CR>

" Json
let g:vim_json_syntax_conceal = 0 " shows double quotes

" Ruby
let g:ruby_default_path=system("which ruby")

" Ale
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_linters = {'c': ['clang'], 'c++': ['clang', 'g++']}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\}

" Git Blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
highlight Blamer guifg=cyan

" Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']


" COC config

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
