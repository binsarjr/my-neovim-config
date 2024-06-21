-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.cmd([[

nnoremap zz :wall<cr>
nnoremap gs :Neotree reveal<cr>
nnoremap <S-F> :Telescope<cr>
nnoremap <S-E> :e ~/.config/nvim/init.lua<cr>
]])

vim.keymap.set("n", "<S-C>", ":Bdelete<CR>")
vim.keymap.set("n", "<\\>", ":Neotree<CR>")

vim.keymap.set("v", "<S->", ":Neotree reveal<CR>")
