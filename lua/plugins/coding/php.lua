return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add php
      vim.list_extend(opts.ensure_installed, {
        "php",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")

      -- Set root_dir to detect php projects
      local root_dir = lspconfig.util.root_pattern("composer.json", "composer.lock", "phpcs.xml", "psalm.xml")
      -- set servers for php
      opts.servers = opts.servers or {}

      local lsp = vim.g.lazyvim_php_lsp

      opts.servers.intelephense = {
        root_dir = root_dir,
        enable = lsp == "intelephense",
      }

      opts.servers.phpactor = {
        root_dir = root_dir,
        enable = lsp == "phpactor",
      }

      opts.servers[lsp] = {
        root_dir = root_dir,
        enable = true,
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "php-cs-fixer")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.phpcsfixer)
      table.insert(opts.sources, nls.builtins.diagnostics.phpcs)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
    },
  },
}
