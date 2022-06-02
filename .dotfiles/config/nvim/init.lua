local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

-- Install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

-- Plugins
require("packer").startup(function()
  use("wbthomason/packer.nvim") -- Packer can manage itself
  use("numToStr/Comment.nvim")
  use("ggandor/lightspeed.nvim") -- Maximize speed while minimizing mental effort and breaks in the flow
  use("glepnir/lspsaga.nvim") -- Highly a performant UI
  use("cappyzawa/trim.nvim")

  -- Statusline
  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Completion
  use("nvim-lua/completion-nvim")
  use({ "neoclide/coc.nvim", branch = "release" })

  -- use("jiangmiao/auto-pairs") -- Pair completion
  use({ "nvim-lua/popup.nvim", requires = { "nvim-lua/plenary.nvim" } })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use("mhartington/formatter.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  use("onsails/lspkind-nvim") -- vscode like pictograms

  use("tpope/vim-repeat")
  use("wellle/targets.vim")
  use("winston0410/cmd-parser.nvim")
  use("lukas-reineke/indent-blankline.nvim") -- indent lines
  use("yamatsum/nvim-cursorline") -- underline same words
  use("mg979/vim-visual-multi") -- multi cursor
  use("tomasiser/vim-code-dark") -- colorscheme
  use("sindrets/diffview.nvim")
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
  use("rmagatti/auto-session")

  use({
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({--[[your custom config--]]
      })
    end,
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })

  use({
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })
end)

-- map function to set nvim keymap
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map leader to space
g.mapleader = ","

-- Gui font
vim.api.nvim_exec([[set guifont=FiraCode\ Nerd\ Font:h10]], false)

-- Load the colorscheme
cmd([[colorscheme codedark]]) -- Put your favorite colorscheme here

-- Lightspeed remap
vim.api.nvim_set_keymap("n", "h", "<Plug>Lightspeed_s", {})
vim.api.nvim_set_keymap("n", "H", "<Plug>Lightspeed_S", {})
vim.api.nvim_set_keymap("v", "h", "<Plug>Lightspeed_s", {})
vim.api.nvim_set_keymap("v", "H", "<Plug>Lightspeed_S", {})

-- Auto yank text on select
vim.api.nvim_set_keymap("v", "<LeftRelease>", '"*ygv', {})

-- Trim trailing space
require("trim").setup({
  disable = { "markdown" },

  -- if you want to ignore space of top
  patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
    [[%s/\(\n\n\)\n\+/\1/]],
  },
})

-- Indent blankline
vim.opt.list = true
require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
})

-- Startup
require("startup").setup({ theme = "dashboard" })

-- Nvim tree
-- following options are the default
require("nvim-tree").setup({
  disable_netrw = true,
})

map("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>r", ":NvimTreeRefresh<CR>", { silent = true })
map("n", "<leader>n", ":NvimTreeFindFile<CR>", { silent = true })

-- COC
map("n", "<leader>h", ":call CocActionAsync('doHover')<CR>")

-- Comment
require("Comment").setup()

-- Auto session
require("auto-session").setup({
  log_level = "info",
  auto_session_enable_last_session = true,
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  pre_save_cmds = { "tabdo NvimTreeClose" },
  post_restore_cmds = { "tabdo NvimTreeOpen" },
})

-- lspkind Icon setup
require("lspkind").init({})

-- gitsigns setup
require("gitsigns").setup({
  numhl = true,
  signcolumn = true,
  current_line_blame = true,
})

-- COC extensions
vim.g.coc_global_extensions = {
  "coc-solargraph",
  "coc-prettier",
  "coc-pairs",
  "coc-highlight",
  "coc-git",
  "coc-diagnostic",
  "coc-actions",
  "coc-yaml",
  "coc-xml",
  "coc-tsserver",
  "coc-stylelint",
  "coc-sourcekit",
  "coc-sh",
  "coc-python",
  "coc-json",
  "coc-java",
  "coc-elixir",
  "coc-css",
  "coc-cmake",
  "coc-clangd",
  "coc-yank",
  "coc-tailwindcss",
  "coc-swagger",
}

-- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
local saga = require("lspsaga")
saga.init_lsp_saga({
  code_action_icon = " ",
  definition_preview_icon = "  ",
  dianostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
})

map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", { silent = true })
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "<leader>cr", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", { silent = true })

-- Setup treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  highlight = { enable = true }
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

vim.g.netrw_liststyle = 3 -- Tree style Netrw

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
    theme = "codedark",
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
require("telescope").load_extension("session-lens")
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
    }
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
map("n", "<leader>s", ":Telescope session-lens search_session<CR>")
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
    args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
    stdin = true,
  }
end

require("formatter").setup({
  logging = false,
  filetype = {
    typescript = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    html = { prettier },
    css = { prettier },
    scss = { prettier },
    markdown = { prettier },
    ruby = {
      -- rubocop
      function()
        return {
          exe = "rubocop", -- might prepend `bundle exec `
          args = { "--auto-correct", "--stdin", "%:p", "2>/dev/null", "|", "awk 'f; /^====================$/{f=1}'" },
          stdin = true,
        }
      end,
    },
    lua = {
      -- Stylua
      function()
        return {
          exe = "stylua",
          args = { "--indent-width", 2, "--indent-type", "Spaces" },
          stdin = false,
        }
      end,
    },
  },
})

-- Runs Formatter on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.rb,*.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
augroup END
]],
  true
)
