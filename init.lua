-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd([[
--     call plug#begin()
--
--     Plug 'famiu/bufdelete.nvim'
--     Plug 'neoclide/coc.nvim', {'branch': 'release'}
--
--     call plug#end()
-- ]])

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

-- require("lspconrig").denols.setup({
--   root_dir = root_pattern("deno.json", "deno.jsonc", ".git"),
-- })

local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup({
  cmd = { "deno", "lsp" },
  file_types = { "typescript", "typescriptreact", "javascript", "javascriptreact" },

  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),

  settings = {
    deno = {
      enable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://deno.land"] = true,
          },
        },
      },
    },
  },
})

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false,
})

-- Configure neo-tree
local neo_tree = require("neo-tree")
neo_tree.setup({
  filesystem = {
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
        ".git",
      },
      never_show = {
        "node_modules",
        ".git",
      },
    },
  },
})

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "target",
    },
  },
})

require("project_nvim").setup({
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  silent_chdir = true,
  show_hidden = true,
  exclude_dirs = {
    ".git",
  },
})
