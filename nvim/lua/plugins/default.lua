return {
	{ "tpope/vim-rails" },
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "neovim_sticky" -- or "vimux", "dispatch", etc.

			-- Test commands
			vim.api.nvim_set_keymap("n", "<Leader>t", ":TestNearest<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>h", ":TestNearest<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>a", ":TestFile<CR>", { noremap = true, silent = true })
			-- vim.api.nvim_set_keymap("n", "<Leader>f", ":TestSuite<CR>", { noremap = true, silent = true })
		end,
	},
	{ "github/copilot.vim" },
	{
		"cjavdev/night-owl.vim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme night-owl]])
		end,
	},
}
