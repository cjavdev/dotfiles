-- Leader key
vim.g.mapleader = " "

-- Basic Settings
vim.opt.autowrite = true -- Automatically write before running commands
vim.opt.backspace = "indent,eol,start" -- Backspace works like most programs
vim.opt.expandtab = true -- Expand tabs to spaces
vim.opt.fileformat = "unix" -- Unix file format
vim.opt.history = 500 -- Keep 50 lines of command history
vim.opt.incsearch = true -- Incremental search
vim.opt.laststatus = 2 -- Always display the status line
vim.opt.backup = false -- Disable backup
vim.opt.swapfile = false -- Disable swapfile
vim.opt.writebackup = false -- Disable write backup
vim.opt.shell = "/bin/bash" -- Use bash shell
vim.opt.showcmd = true -- Display incomplete commands
vim.opt.shiftround = true -- Round indent
vim.opt.termguicolors = true -- Use GUI colors for terminal
-- vim.opt.t_Co = "256"           -- Use more colors (256)
vim.opt.colorcolumn = "49" -- Show color column at 49
vim.opt.wrap = false -- Disable wrapping

-- Tabs and Indentation
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.shiftwidth = 2 -- Size of an indent

-- Display extra whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", nbsp = "." }

-- Number settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5

-- Toggle between last two files
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", { noremap = true, silent = true })

-- ALE configuration
vim.g.ale_linters = { ruby = { "ruby", "rubocop" }, eruby = { "erblint" } }
vim.g.ale_fixers = { ruby = { "rubocop" }, eruby = { "erblint" } }
vim.g.ale_fix_on_save = 1

-- HTML indentation
vim.g.html_indent_tags = "li\\|p"

-- Quicker window movement
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Function to strip trailing whitespace
local function strip_trailing_whitespace()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd([[ %s/\s\+$//e ]])
	vim.api.nvim_win_set_cursor(0, pos)
end

-- Autocommand to strip trailing whitespace before saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = strip_trailing_whitespace,
})

-- Commands to correct common typos
vim.cmd("command! WQ wq")
vim.cmd("command! Wq wq")
vim.cmd("command! W w")
vim.cmd("command! Q q")

-- Split commands
vim.api.nvim_set_keymap("n", "<Leader>\\", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>-", ":split<CR>", { noremap = true, silent = true })

-- Copy selected text to clipboard
vim.api.nvim_set_keymap("v", "<C-x>", ":!pbcopy<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-c>", ":w !pbcopy<CR><CR>", { noremap = true, silent = true })

require("config.lazy")
