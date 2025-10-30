return {
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},

	{
		"cappyzawa/trim.nvim",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"mhartington/formatter.nvim",
		opts = {},
	},
	{
		"navarasu/onedark.nvim",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"onsails/lspkind.nvim",
		opts = {},
	},
	{
		"github/copilot.vim",
		opts = {},
		config = function() end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
	{
		"airblade/vim-gitgutter",
		opts = {},
		config = function() end,
	},
	{
		"tpope/vim-fugitive",
		opts = {},
		config = function() end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{
		"mg979/vim-visual-multi",
		opts = {},
		config = function() end,
	},
	{
		"yamatsum/nvim-cursorline",
		opts = {},
		config = function() end,
	},
	{
		"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
		lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
		dependencies = {
			-- main one
			{ "ms-jpq/coq_nvim", branch = "coq" },

			-- 9000+ Snippets
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },

			-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
			-- Need to **configure separately**
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
			-- - shell repl
			-- - nvim lua api
			-- - scientific calculator
			-- - comment banner
			-- - etc
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = "shut-up", -- if you want to start COQ at startup
				keymap = {
					recommended = false,
					jump_to_mark = "<c-,>",
				},
				-- keymap = {
				--   recommended = false,
				-- },
				-- Your COQ settings here
			}
		end,
		config = function()
			-- Your LSP settings here
			-- require("lspconfig").syntax_tree.setup({})
			-- require("lspconfig").ruby_lsp.setup({})
			-- require("lspconfig").rubocop.setup({})
			-- require("lspconfig").solargraph.setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			-- Your LSP settings here
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"declancm/maximize.nvim",
		config = true,
	},
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
			delay = 1000,
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
		opts = {
			strategies = {
				-- Change the default chat adapter
				chat = {
					adapter = "anthropic",
				},
			},
			opts = {
				-- Set debug logging
				log_level = "DEBUG",
			},
		},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example
			provider = "claude",
			auto_suggestions_provider = "copilot",
			providers = {
				copilot = {
					model = "gpt-4.1",
				},
				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "gpt-4.1", -- your desired model (or use gpt-4o, etc.)
					extra_request_body = {
						timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
						temperature = 0,
						max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
						--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
					},
				},
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-5",
					extra_request_body = {
						temperature = 0,
						max_tokens = 4096, -- Increase this to include reasoning tokens (for reasoning models)
					},
				},
				ollama = {
					endpoint = "http://10.11.0.13:11434",
					model = "qwen3:8b",
				},
				local_ollama = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = "http://10.11.0.13:11434/v1",
					model = "deepseek-r1:7b",
					-- mode = "legacy",
					--disable_tools = true, -- Open-source models often do not support tools.
				},
			},
		},
		-- rag_service = {
		-- 	enabled = true, -- Enables the RAG service
		-- 	host_mount = os.getenv("HOME"), -- Host mount path for the rag service
		-- 	provider = "openai", -- The provider to use for RAG service (e.g. openai or ollama)
		-- 	llm_model = "gpt-4o", -- The LLM model to use for RAG service
		-- 	embed_model = "gpt-4o", -- The embedding model to use for RAG service
		-- 	endpoint = "https://api.openai.com/v1", -- The API endpoint for RAG service
		-- },
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>k", nil, desc = "AI/Claude Code" },
			{ "<leader>kc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>kr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>kC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>km", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>kb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>ks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>ks",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},

	-- {
	-- 	"ravitemer/mcphub.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
	-- 	config = function()
	-- 		require("mcphub").setup()
	-- 	end,
	-- },
}
