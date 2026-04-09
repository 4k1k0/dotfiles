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

-- LSP key mappings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
