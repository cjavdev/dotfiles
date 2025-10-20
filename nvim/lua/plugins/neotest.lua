return {
	{
		"vim-test/vim-test",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		keys = {
			{ "<leader>r", "<cmd>TestNearest<cr>", desc = "Run test under cursor" },
			{ "<leader>t", "<cmd>TestFile<cr>", desc = "Run all tests in file" },
			{ "<leader>T", "<cmd>TestSuite<cr>", desc = "Run entire test suite" },
			{ "<leader>l", "<cmd>TestLast<cr>", desc = "Run last test" },
		},
		config = function()
			-- Run tests in a toggleterm terminal for persistence
			vim.g["test#strategy"] = "toggleterm"
			vim.g["test#neovim#term_position"] = "belowright"
			vim.g["test#preserve_screen"] = 1
		end,
	},
}
