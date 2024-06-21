return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "<C-]>",
        clear_suggestion = "<C-[>",
        -- accept_word = "<C-j>",
      },
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false,
    },
  },
}
