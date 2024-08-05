-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-e>", ":Neotree toggle reveal<CR>", { desc = "Toggle Neotree Explorer ", silent = true })
vim.keymap.set("n", "zz", ":wall<CR>", { desc = "Save All Buffer", silent = true })
