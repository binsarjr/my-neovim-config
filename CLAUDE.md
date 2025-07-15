# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration repository using **LazyVim** as the plugin manager. The setup is designed for TypeScript/JavaScript development with modern tooling support.

## Key Architecture

- **Entry Point**: `init.lua` loads `config.lazy` and `init_cmp`
- **Plugin Management**: Uses `lazy.nvim` with modular plugin organization
- **Structure**: Lua-based configuration organized in `lua/` directory
- **Language Support**: TypeScript/JavaScript, Lua, Python

## Directory Structure

```
lua/
├── config/           # Core configuration
│   ├── lazy.lua     # LazyVim bootstrap and plugin setup
│   ├── keymaps.lua  # Custom keybindings
│   ├── options.lua  # Neovim options and LazyVim overrides
│   └── autocmds.lua # Auto commands
├── plugins/         # Plugin configurations
│   ├── coding/      # Language-specific configs (typescript, tailwindcss, etc.)
│   ├── formatter/   # Prettier and formatting setup
│   └── copilot/     # AI assistant configurations
└── init_cmp.lua     # nvim-cmp completion setup
```

## Development Commands

### Plugin Management
```bash
# LazyVim commands within Neovim
:Lazy                # Open LazyVim plugin manager
:Lazy sync           # Install/update all plugins
:Lazy health         # Check plugin health
:Mason               # LSP server management
:TSUpdate            # Update Treesitter parsers
```

### Code Formatting & Linting
```bash
# Within Neovim
:lua vim.lsp.buf.format()    # Format current buffer
:Prettier                   # Format with Prettier (if config found)
:lua require('stylua').format()  # Format Lua files
```

### LSP & Language Support
- **TypeScript**: Uses `tsserver` via `typescript.nvim` with organize imports and rename file commands
- **TailwindCSS**: Configured with Phoenix/Elixir support and color preview in completion
- **Python**: Uses `pyright` and `ruff` for linting
- **Styling**: Uses `stylua` for Lua formatting, `prettier` for web languages

## Key Configuration Details

### Plugin Sources
- **LazyVim**: Base configuration and plugin specs
- **Language Extras**: `lazyvim.plugins.extras.lang.typescript`, `python`
- **Utilities**: `lazyvim.plugins.extras.util.project`

### Custom Keymaps
- `<S-e>`: Toggle Neotree file explorer
- `gs`: Reveal current file in Neotree
- `zz`: Save all buffers
- `<leader>fp`: Find plugin files with Telescope

### Formatting Rules
- **Lua**: 2 spaces, 120 column width (see `stylua.toml`)
- **Prettier**: Only runs when config file is present (`lazyvim_prettier_needs_config = true`)

## Notable Features

- **Avante.nvim**: AI coding assistant with image support and markdown rendering
- **Supermaven**: AI autocompletion (instead of GitHub Copilot)
- **TailwindCSS Colorizer**: Real-time color preview in completion
- **Phoenix/Elixir Support**: Configured for HEEx templates
- **Multi-language Support**: TypeScript, Python, Lua, PHP, Svelte, etc.