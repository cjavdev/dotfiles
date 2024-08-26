return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-live-grep-args.nvim",
		-- This will not install any breaking changes.
		-- For major updates, this must be adjusted manually.
		version = "^1.0.0",
	},
	-- replace all Telescope keymaps with only one mapping
	keys = function()
		return {
			{ "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>g", LazyVim.pick("live_grep", { root = true }), desc = "Grep (cwd)" },
		}
	end,
	opts = {
		defaults = {
			vimgrep_arguments = {
				"--ignore-case",
			},
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("live_grep_args")
	end,
}
