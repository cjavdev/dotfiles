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
-- vim.opt.colorcolumn = "49" -- Show color column at 49 (For Vertical Video)
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

-- Always trim whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Commands to correct common typo
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
