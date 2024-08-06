local cmp = require("cmp")

cmp.setup({
  window = {
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Add border for the completion menu
      col_offset = 1, -- Adjust column offset if necessary
      row_offset = 1, -- Adjust row offset if necessary
      winblend = 0, -- Set the window blend to 0 to disable the transparency
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Add border for the documentation menu
      winblend = 0,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      -- Customize the display of the completion window
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
        supermaven = "[SuperMaven]",
      })[entry.source.name]
      return vim_item
    end,
  },
  experimental = {
    ghost_text = false, -- Enable ghost text feature to avoid overlapping
  },
  mapping = {
    --   ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    --   ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<S-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    --   ["<C-e>"] = cmp.mapping({
    --     i = cmp.mapping.abort(),
    --     c = cmp.mapping.close(),
    --   }),
    --   ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Set `select` to `false` to disable automatic confirmation.
    --   ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    --   ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },

  -- other configurations...
})

return {}
