return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add php and blade
      vim.list_extend(opts.ensure_installed, {
        "php",
        "blade",
        "php_only",
      })
    end,
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
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

      -- Only configure intelephense
      opts.servers.intelephense = {
        root_dir = root_dir,
        enable = true,
        autostart = true,
        cmd = { "intelephense", "--stdio" },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "php-cs-fixer")
      table.insert(opts.ensure_installed, "phpstan")
      -- Hapus phpcs dari mason installation
      -- Explicitly exclude phpactor and phpcs from auto-install
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "phpactor" and pkg ~= "phpcs"
      end, opts.ensure_installed or {})
    end,
  },
  {
    -- Configure nvim-lint for PHP linting
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = { "phpstan" }, -- Hanya phpstan, hilangkan phpcs
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer" },
      },
    },
  },
  {
    -- Add the Laravel.nvim plugin which gives the ability to run Artisan commands
    -- from Neovim.
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
      "kevinhwang91/promise-async", -- Fix missing dependency
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup({
        lsp_server = "intelephense",
        features = { 
          null_ls = { enable = false },
          route_info = { enable = true }, -- Fix healthcheck issue
          commands = { enable = true },
        },
      })
    end,
    opts = {},
  },
  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    ft = { "blade", "php" },
  },
}