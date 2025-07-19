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
      -- opts.formatters.prettier = {
      --   condition = function(_, ctx)
      --     return has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or has_config(ctx))
      --   end,
      -- }
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
