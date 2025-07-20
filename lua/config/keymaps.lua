-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-e>", ":Neotree toggle<CR>", { desc = "Toggle Neotree Explorer ", silent = true })
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus Neotree Explorer", silent = true })
vim.keymap.set("n", "gs", ":Neotree reveal<CR>", { desc = "Reveal Neotree Explorer ", silent = true })
vim.keymap.set("n", "zz", ":wall<CR>", { desc = "Save All Buffer", silent = true })

-- Buffer management keymaps
-- vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOther<CR>", { desc = "Delete Other Buffers", silent = true })
-- vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = "Delete Left Buffers", silent = true })
-- vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = "Delete Right Buffers", silent = true })
