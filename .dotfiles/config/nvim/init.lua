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

-- autoread
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- vim.cmd([[colorscheme onedark]])

require("onedark").setup({
	style = "darker",
	highlights = {
		DiffDelete = { fg = "$diff_delete" },
	},
})

require("onedark").load()

-- local c = require("vscode.colors")
-- require("vscode").setup({
--   transparent = true,
--   italic_comments = true,
--   disable_nvimtree_bg = true,
--   group_overrides = {
--     Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--   },
-- })

-- Auto yank text on select
vim.api.nvim_set_keymap("v", "<LeftRelease>", '"*ygv', {})

-- Trim trailing space
require("trim").setup({
	ft_blocklist = { "markdown" },

	-- if you want to ignore space of top
	patterns = {
		[[%s/\s\+$//e]],
		[[%s/\($\n\s*\)\+\%$//]],
		[[%s/\(\n\n\)\n\+/\1/]],
	},
})

-- Indent blankline
vim.opt.list = true
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({ scope = { highlight = highlight } })

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- Nvim tree
-- following options are the default
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

map("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>r", ":NvimTreeRefresh<CR>", { silent = true })
map("n", "<leader>n", ":NvimTreeFindFile<CR>", { silent = true })

-- Comment
require("Comment").setup()

-- RSPEC integrated
vim.keymap.set(
	"n",
	"<leader>ti",
	"<cmd>lua require('rspec.integrated').run_spec_file()<cr>",
	{ silent = true, noremap = true }
)

-- lspkind Icon setup
require("lspkind").init({})

-- Setup treesitter
require("nvim-treesitter.install").prefer_git = true
local ts = require("nvim-treesitter.configs")
ts.setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },
	highlight = { enable = true },
})

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

--- location icon: 
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { " ", " " },
		section_separators = { "", "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode", "paste" },
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
		},
		lualine_c = {
			{ "diagnostics", sources = { "nvim_diagnostic" } },
			function()
				return "%="
			end,
			{
				"filename",
				file_status = true,
				path = 2,
			},
		},
		lualine_x = { "filetype" },
		lualine_y = {
			{
				"progress",
			},
		},
		lualine_z = {
			{
				"location",
				icon = "",
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

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

-- Telescope Global remapping
local actions = require("telescope.actions")
require("telescope").load_extension("file_browser")
require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "get_dropdown",
		},
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			mappings = {
				i = {
					["<C-w>"] = "delete_buffer",
				},
				n = {
					["<C-w>"] = "delete_buffer",
				},
			},
		},
	},
})

map(
	"n",
	"<leader>p",
	'<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<cr>'
)
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map(
	"n",
	"<leader>g",
	'<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))<cr>'
)
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>f", ":Telescope file_browser<CR>")

-- Change window shortcuts
map("n", "<C-S-Up>", ":wincmd k<CR>")
map("n", "<C-S-Down>", ":wincmd j<CR>")
map("n", "<C-S-Left>", ":wincmd h<CR>")
map("n", "<C-S-Right>", ":wincmd l<CR>")

-- Prettier function for formatter
local prettier = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

-- local util = require("formatter.util")
-- require("formatter").setup({
--   logging = false,
--   filetype = {
--     javascript = { prettier },
--     typescript = { prettier },
--     html = { prettier },
--     css = { prettier },
--     scss = { prettier },
--     markdown = { prettier },
--     ruby = {
--       -- syntax_tree
--       function()
--         return {
--           exe = "stree", -- might prepend `bundle exec `
--           args = {
--             util.escape_path(util.get_current_buffer_file_path()),
--           },
--           stdin = true,
--         }
--       end,
--     },
--     -- ruby = { prettier },
--     -- ruby = {
--     --   -- rubocop
--     --   function()
--     --     return {
--     --       exe = "rubocop", -- might prepend `bundle exec `
--     --       args = { "--auto-correct", "--stdin", "%:p", "2>/dev/null", "|", "awk 'f; /^====================$/{f=1}'" },
--     --       stdin = true,
--     --     }
--     --   end,
--     -- },
--     lua = {
--       -- Stylua
--       function()
--         return {
--           exe = "stylua",
--           args = { "--indent-width", 2, "--indent-type", "Spaces" },
--           stdin = false,
--         }
--       end,
--     },
--   },
-- })
--
-- -- Runs Formatter on save
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- augroup("__formatter__", { clear = true })
-- autocmd("BufWritePost", {
--   group = "__formatter__",
--   command = ":FormatWrite",
-- })

-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.rb,*.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
-- augroup END
-- ]],
--   true
-- )

require("conform").setup({
	async = true,
	formatters_by_ft = {
		ruby = { "syntax_tree", "rubocop" },

		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		-- javascript = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "standardjs" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_format = "fallback" })
	end,
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

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

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

vim.api.nvim_exec(
	[[
if &diff
    colorscheme evening
endif
]],
	false
)
