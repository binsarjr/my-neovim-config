return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },
    opts = function(_, opts)
      table.insert(opts, {
        defaults = {
          file_ignore_patterns = {
            "node_modules",
          },
        },
      })
    end,
  },
}
