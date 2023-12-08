vim.g.mapleader = ","

-- Manage tabs
vim.keymap.set("n", "<leader>q", vim.cmd.bd)
vim.keymap.set("n", "<leader>l", vim.cmd.bp)
vim.keymap.set("n", "<leader>;", vim.cmd.bn)
vim.keymap.set("n", "<leader>ñ", vim.cmd.bn)

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

