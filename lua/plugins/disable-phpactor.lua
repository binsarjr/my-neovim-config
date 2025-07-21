-- Force disable phpactor completely
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Override LazyVim's PHP config to skip phpactor
      if opts.servers then
        opts.servers.phpactor = nil
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure phpactor is never auto-configured
      if opts.ensure_installed then
        opts.ensure_installed = vim.tbl_filter(function(server)
          return server ~= "phpactor"
        end, opts.ensure_installed)
      end
    end,
  },
}