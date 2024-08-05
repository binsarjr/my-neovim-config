return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        silent_chdir = true,
        show_hidden = true,
        exclude_dirs = {
          ".git",
        },
      })
    end,
  },
}
