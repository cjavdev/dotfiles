-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- System clipboard mappings
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({"n", "v"}, "<C-v>", '"+p', { desc = "Paste from system clipboard" })

-- Window splits
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<cr><C-w>l", { desc = "Vertical split and focus right" })
