return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				light_style = "day",
				transparent = false,
				terminal_colors = false,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
				sidebars = { "qf", "help" },
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors)
					highlights.Cursor = { bg = "#ffffff", fg = "#000000" } -- Solid white cursor
					highlights.CursorLine = { bg = "#1e2030" } -- Subtle line highlight
					highlights.CursorColumn = { bg = "#292e42" } -- Column highlight
					highlights.TermCursor = { bg = "#ffffff", fg = "#000000" } -- Terminal cursor
					highlights.TermCursorNC = { bg = "#ffffff", fg = "#000000" } -- Terminal cursor (non-current)
				end,
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
