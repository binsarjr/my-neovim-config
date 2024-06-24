-- plugin/prettyphp.lua
return {
  "nvim-lua/plenary.nvim", -- dependensi yang mungkin diperlukan
  config = function()
    vim.cmd(
      [[
            augroup PrettyPHP
                autocmd!
                autocmd BufWritePost *.php !pretty-php %
            augroup END
        ]],
      false
    )
  end,
}
