local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

-- Map leader to coma
g.mapleader = ","

require("config.lazy")

-- map function to set nvim keymap
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Gui font
vim.api.nvim_exec([[set guifont=FiraCode\ Nerd\ Font:h10]], false)

-- Load the colorscheme
vim.o.background = "dark" -- or "light" for light mode

-- Allow Neovim to read project-specific configs
vim.o.exrc = true

-- For safety: require trust before running local configs
vim.o.secure = true

-- autoread
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- Auto yank text on select
vim.api.nvim_set_keymap("v", "<LeftRelease>", '"*ygv', {})

-- RSPEC integrated
vim.keymap.set(
	"n",
	"<leader>ti",
	"<cmd>lua require('rspec.integrated').run_spec_file()<cr>",
	{ silent = true, noremap = true }
)

opt.backspace = { "indent", "eol", "start" }
opt.clipboard:append({ "unnamedplus" })
opt.completeopt = "menuone,noselect"
opt.cursorline = true
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.expandtab = true -- Use spaces instead of tabs
opt.foldenable = false
opt.foldmethod = "indent"
opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = true -- Highlight found searches
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
opt.linebreak = true -- Stop words being broken on wrap
opt.number = true -- Show line numbers
opt.numberwidth = 5 -- Make the gutter wider by default
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = "en"
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.updatetime = 250 -- don't give |ins-completion-menu| messages.
opt.wrap = true
opt.mouse = "a"
opt.ts = 2
opt.sw = 2
opt.history = 100
opt.undolevels = 1000
opt.undofile = true
-- opt.undodir = "~/.nvim/undo" -- WARNING: it's create fucking \~ folders
opt.autoread = true
opt.swapfile = false

vim.g.netrw_liststyle = 3 -- Tree style Netrw

-- Markdown preview autostart
vim.g.mkdp_auto_start = 1

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
vim.api.nvim_exec(
	[[
augroup markdownSpell
    autocmd!
    autocmd FileType markdown,md,txt setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
augroup END
]],
	false
)

-- Open nvimrc file
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>sv", ":luafile %<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- More molecular undo of text
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ":", ":<c-g>u")

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- Line bubbling
-- Use these two if you don't have prettier
--map('n'), '<c-j>', '<cmd>m .+1<CR>==')
--map('n,) <c-k>', '<cmd>m .-2<CR>==')
map("n", "<c-j>", "<cmd>m .+1<CR>", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>", { silent = true })
map("i", "<c-j> <Esc>", "<cmd>m .+1<CR>==gi", { silent = true })
map("i", "<c-k> <Esc>", "<cmd>m .-2<CR>==gi", { silent = true })
map("v", "<c-j>", "<cmd>m +1<CR>gv=gv", { silent = true })
map("v", "<c-k>", "<cmd>m -2<CR>gv=gv", { silent = true })

-- Simpler increment/decrement integers
map("n", "+", "<C-a>", { silent = true })
map("v", "+", "<C-a>", { silent = true })
map("n", "-", "<C-x>", { silent = true })
map("v", "-", "<C-x>", { silent = true })

--Auto close tags
map("i", ",/", "</<C-X><C-O>")

-- Change window shortcuts
map("n", "<C-S-Up>", ":wincmd k<CR>")
map("n", "<C-S-Down>", ":wincmd j<CR>")
map("n", "<C-S-Left>", ":wincmd h<CR>")
map("n", "<C-S-Right>", ":wincmd l<CR>")

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- Neovide
-- vim.g.neovide_cursor_vfx_mode = "railgun"
--
-- if vim.g.neovide then
--   vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
--   vim.keymap.set("v", "<D-c>", '"+y') -- Copy
--   vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
--   vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
--   vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
--   vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
-- end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- File types
vim.api.nvim_exec(
	[[
    au BufRead *.thor set filetype=ruby
]],
	false
)

vim.api.nvim_exec(
	[[
if &diff
    colorscheme evening
endif
]],
	false
)

require("config/avante")
