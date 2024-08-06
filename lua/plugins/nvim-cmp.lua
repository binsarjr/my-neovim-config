local cmp = require("cmp")

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "SergioRibera/cmp-dotenv",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "dotenv",
        -- Defaults
        option = {
          path = ".",
          load_shell = true,
          item_kind = cmp.lsp.CompletionItemKind.Variable,
          eval_on_confirm = false,
          show_documentation = true,
          show_content_on_docs = true,
          documentation_kind = "markdown",
          dotenv_environment = ".*",
          file_priority = function(a, b)
            -- Prioritizing local files
            return a:upper() < b:upper()
          end,
        },
      })
    end,
  },
}
