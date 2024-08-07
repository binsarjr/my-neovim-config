return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add prisma
      vim.list_extend(opts.ensure_installed, {
        "prisma",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")

      -- Set root_dir to detect prisma projects
      local root_dir = lspconfig.util.root_pattern("prisma.yml", "prisma/schema.prisma")
      -- set servers for prisma
      opts.servers = opts.servers or {}

      opts.servers.prismals = {
        root_dir = root_dir,
        single_file_support = true,
      }
    end,
  },
}
