-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-update terminal title with current project name
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("TerminalTitle", { clear = true }),
  callback = function()
    local cwd = vim.fn.getcwd()
    local project_name = vim.fn.fnamemodify(cwd, ":t")
    if project_name and project_name ~= "" then
      vim.opt.titlestring = project_name .. " - " .. vim.fn.expand("%:t")
    else
      vim.opt.titlestring = vim.fn.expand("%:t")
    end
  end,
})

vim.opt.title = true
