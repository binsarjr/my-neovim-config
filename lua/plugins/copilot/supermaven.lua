local cmp = require("cmp")

return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-]>",
          clear_suggestion = "<C-\\>",
          accept_word = "<C-j>",
        },
      })
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "supermaven" })
  --   end,
  -- },
}
