return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "typescript", "javascript", "json", "yaml", "markdown" },
				auto_install = true,
				highlight = { enable = true },
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim" },
		config = function()
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")

			-- TypeScript
			lspconfig.ts_ls.setup({})

			-- Stainless LSP (custom server)
			if not configs.stainless_ls then
				configs.stainless_ls = {
					default_config = {
						cmd = { "stainless-language-server", "--stdio" },
						filetypes = { "yaml", "json" },
						root_dir = lspconfig.util.root_pattern(".stainless"),
					},
				}
			end
			lspconfig.stainless_ls.setup({})

			-- Global LSP keybindings
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}
