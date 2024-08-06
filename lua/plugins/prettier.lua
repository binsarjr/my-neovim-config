local supported = {
  "typescript",
  "css",
  "scss",
  "less",
  "json",
  "graphql",
  "markdown",
  "yaml",
  "html",
  "svelte",
}

local function has_parser(ctx)
  local ft = vim.api.nvim_buf_get_option(ctx.bufnr, "filetype")
  local parsers = require("nvim-treesitter.parsers")
  return parsers.has_parser(ft)
end

local function has_config(ctx)
  -- Implementasikan logika untuk menentukan apakah ada konfigurasi Prettier
  local config_files = { ".prettierrc", ".prettierrc.json", ".prettierrc.js" }
  local root_dir = vim.fn.expand("%:p:h")
  for _, config_file in ipairs(config_files) do
    if vim.loop.fs_stat(root_dir .. "/" .. config_file) then
      return true
    end
  end
  return false
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "prettier")
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    ---@param opts ConformOpts
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = { "prettier" }
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        condition = function(_, ctx)
          return has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or has_config(ctx))
        end,
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
}
