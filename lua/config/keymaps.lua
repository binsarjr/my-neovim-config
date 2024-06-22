-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-F>", ":Telescope live_grep<CR>", { desc = "Telescope Find Text All", silent = true })
vim.keymap.set("n", "zz", ":wall<CR>", { desc = "Save all", silent = true })
vim.keymap.set("n", "<S-E>", ":Neotree reveal<CR>", { desc = "Open Explorer with current file", silent = true })
vim.keymap.set("n", "tt", ":Telescope<CR>", { desc = "Telescope" })

vim.keymap.set("n", "<S-T>", ":ToggleTerm<CR>", { desc = "Toggle floating terminal" })

-- vim.keymap.set("n", "<S-C>", ":Bdelete<CR>")
