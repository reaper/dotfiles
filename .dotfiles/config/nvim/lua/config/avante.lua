-- AVANTE
-- prefil edit window with common scenarios to avoid repeating query and submit immediately
local prefill_edit_window = function(request)
	require("avante.api").edit()
	local code_bufnr = vim.api.nvim_get_current_buf()
	local code_winid = vim.api.nvim_get_current_win()
	if code_bufnr == nil or code_winid == nil then
		return
	end
	vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
	-- Optionally set the cursor position to the end of the input
	vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
	-- Simulate Ctrl+S keypress to submit
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
end

-- NOTE: most templates are inspired from ChatGPT.nvim -> chatgpt-actions.json
local avante_grammar_correction = "Correct the text to standard English, but keep any code blocks inside intact."
local avante_keywords = "Extract the main keywords from the following text"
local avante_code_readability_analysis = [[
  You must identify any readability issues in the code snippet.
  Some readability issues to consider:
  - Unclear naming
  - Unclear purpose
  - Redundant or obvious comments
  - Lack of comments
  - Long or complex one liners
  - Too much nesting
  - Long variable names
  - Inconsistent naming and code style.
  - Code repetition
  You may identify additional problems. The user submits a small section of code from a larger file.
  Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
  If there's no issues with code respond with only: <OK>
]]
local avante_optimize_code = "Optimize the following code"
local avante_summarize = "Summarize the following text"
local avante_explain_code = "Explain the following code"
local avante_complete_code = "Complete the following codes written in " .. vim.bo.filetype
local avante_add_docstring = "Add docstring to the following codes"
local avante_fix_bugs = "Fix the bugs inside the following codes if any"
local avante_add_tests = "Implement tests for the following code"
local avante_commit_changes =
	"Generate a commit based on the current state of the working directory and the following code. The commit message should be concise and descriptive, summarizing the changes made. The commit message should be in the format: <type>(<scope>): <subject> where type is one of: feat, fix, docs, style, refactor, perf, test, chore and scope is the area of the codebase affected by the changes. The subject should be a short summary of the changes made."
local avante_branch_changes =
	"Generate a fancy but professional title and succint description based on the git branch changes for a github pull request. Changes are commits compared to the main branch."
local avante_run_test = "Run the current test"

require("which-key").add({
	{ "<leader>a", group = "Avante" }, -- NOTE: add for avante.nvim
	{
		mode = { "n", "v" },
		{
			"<leader>ag",
			function()
				require("avante.api").ask({ question = avante_grammar_correction })
			end,
			desc = "avante: grammar correction(ask)",
		},
		{
			"<leader>ak",
			function()
				require("avante.api").ask({ question = avante_keywords })
			end,
			desc = "avante: keywords(ask)",
		},
		{
			"<leader>al",
			function()
				require("avante.api").ask({ question = avante_code_readability_analysis })
			end,
			desc = "avante: code readability analysis(ask)",
		},
		{
			"<leader>ao",
			function()
				require("avante.api").ask({ question = avante_optimize_code })
			end,
			desc = "avante: optimize code(ask)",
		},
		{
			"<leader>am",
			function()
				require("avante.api").ask({ question = avante_summarize })
			end,
			desc = "avante: summarize text(ask)",
		},
		{
			"<leader>ax",
			function()
				require("avante.api").ask({ question = avante_explain_code })
			end,
			desc = "avante: explain code(ask)",
		},
		{
			"<leader>ac",
			function()
				require("avante.api").ask({ question = avante_complete_code })
			end,
			desc = "avante: complete code(ask)",
		},
		{
			"<leader>ad",
			function()
				require("avante.api").ask({ question = avante_add_docstring })
			end,
			desc = "avante: docstring(ask)",
		},
		{
			"<leader>ab",
			function()
				require("avante.api").ask({ question = avante_fix_bugs })
			end,
			desc = "avante: fix bugs(ask)",
		},
		{
			"<leader>au",
			function()
				require("avante.api").ask({ question = avante_add_tests })
			end,
			desc = "avante: add tests(ask)",
		},
		{
			"<leader>aq",
			function()
				require("avante.api").ask({ question = avante_commit_changes })
			end,
			desc = "avante: commit changes (ask)",
		},
		{
			"<leader>ar",
			function()
				require("avante.api").ask({ question = avante_run_test })
			end,
			desc = "avante: run test(ask)",
		},
		{
			"<leader>aw",
			function()
				require("avante.api").ask({ question = avante_branch_changes })
			end,
			desc = "avante: branch changes(ask)",
		},
	},
})

require("which-key").add({
	{ "<leader>a", group = "Avante" }, -- NOTE: add for avante.nvim
	{
		mode = { "v" },
		{
			"<leader>aG",
			function()
				prefill_edit_window(avante_grammar_correction)
			end,
			desc = "avante: grammar correction(edit)",
		},
		{
			"<leader>aK",
			function()
				prefill_edit_window(avante_keywords)
			end,
			desc = "avante: keywords(edit)",
		},
		{
			"<leader>aO",
			function()
				prefill_edit_window(avante_optimize_code)
			end,
			desc = "avante: optimize code(edit)",
		},
		{
			"<leader>aC",
			function()
				prefill_edit_window(avante_complete_code)
			end,
			desc = "avante: complete code(edit)",
		},
		{
			"<leader>aD",
			function()
				prefill_edit_window(avante_add_docstring)
			end,
			desc = "avante: docstring(edit)",
		},
		{
			"<leader>aB",
			function()
				prefill_edit_window(avante_fix_bugs)
			end,
			desc = "avante: fix bugs(edit)",
		},
		{
			"<leader>aU",
			function()
				prefill_edit_window(avante_add_tests)
			end,
			desc = "avante: add tests(edit)",
		},
	},
})
--
-- require("avante").setup({
-- 	-- system_prompt as function ensures LLM always has latest MCP server state
-- 	-- This is evaluated for every message, even in existing chats
-- 	system_prompt = function()
-- 		local hub = require("mcphub").get_hub_instance()
-- 		return hub and hub:get_active_servers_prompt() or ""
-- 	end,
-- 	-- Using function prevents requiring mcphub before it's loaded
-- 	custom_tools = function()
-- 		return {
-- 			require("mcphub.extensions.avante").mcp_tool(),
-- 		}
-- 	end,
-- })
