# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built on top of **LazyVim**, a feature-rich Neovim starter. The configuration emphasizes TypeScript/JavaScript development, Python, and modern web technologies (Tailwind, MDX, Prisma).

## Architecture

### Plugin Management
- **Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) (bootstrapped in `lua/config/lazy.lua:1`)
- **Core framework**: LazyVim provides the foundation, with custom plugins loaded from `lua/plugins/`
- **Plugin structure**: Each file in `lua/plugins/` returns a table of plugin specifications that lazy.nvim loads

### Configuration Structure
```
init.lua                    # Entry point - bootstraps lazy.nvim
lua/
  config/
    lazy.lua               # Lazy.nvim setup and LazyVim extras configuration
    options.lua            # Vim options and settings
    keymaps.lua            # Custom key mappings
    autocmds.lua           # Autocommands
  plugins/
    *.lua                  # Individual plugin configurations
```

### Key Architecture Decisions

1. **LazyVim Extras System**: The config imports specific LazyVim extras (lua/config/lazy.lua:24-39):
   - Language support: TypeScript, JSON, Python, Markdown, Tailwind
   - Tools: ESLint, Prettier, DAP (debugger), testing
   - AI: GitHub Copilot, Sidekick (Claude integration)
   - UI: Snacks picker and explorer

2. **Completion**: Uses **blink.cmp** (not nvim-cmp) with super-tab preset and ghost text enabled (lua/plugins/blink.lua)

3. **AI Integration**: Primary AI tool is **Sidekick** for Claude Code integration via tmux multiplexer (lua/plugins/sidekick.lua:6-8)

4. **File Navigation**: Uses **Snacks picker/explorer** (not fzf-lua, which is disabled) (lua/plugins/snacks.lua)

5. **Formatting Strategy**: Prefers Biome over Prettier when available, with fallback chain (lua/plugins/formatting.lua:11-17):
   - JS/TS/JSON: `biome-check` → `prettierd` → `prettier`
   - Python: `ruff_format` + `ruff_organize_imports`

## Development Workflow

### Neovim Configuration Testing
To test changes to this Neovim configuration:
```bash
# Launch Neovim (it will auto-sync plugins on startup via lazy.nvim)
nvim

# Inside Neovim, manage plugins:
:Lazy            # Open lazy.nvim UI
:Lazy sync       # Update/install all plugins
:Lazy clean      # Remove unused plugins
```

### LSP Configuration
LSP servers are managed through Mason and configured in `lua/plugins/lspconfig.lua`:
- Python: Pyright (with custom diagnostics) + Ruff LSP (hover disabled)
- TypeScript, JSON, etc.: Configured via LazyVim extras

### Formatting
Formatting is handled by conform.nvim with auto-format on save (when `vim.g.lazyvim_eslint_auto_format = true`):
```vim
:ConformInfo      " Check formatter status for current buffer
```

### Key Bindings
Important custom keymaps (lua/config/keymaps.lua):
- `<Leader>f` - Force format current buffer
- `<A-.>` - LSP code actions
- `<A-/>` - Source-level actions (organize imports, etc.)
- `<Leader>aa` - Toggle Sidekick CLI (Claude integration)
- `<Leader>at` - Send current line/selection to Sidekick
- `<Leader>ac` - Toggle Claude directly

### Sidekick AI Integration
Sidekick provides Claude integration with tmux backend:
- Edit suggestions: Press `<Tab>` to jump to next edit or apply current edit
- CLI toggle: `<Ctrl-.>` works in all modes (normal, insert, terminal, visual)
- Send contexts: `{this}`, `{file}`, `{selection}` for focused AI assistance

## Configuration Guidelines

### Adding New Plugins
1. Create a new file in `lua/plugins/` (e.g., `lua/plugins/myplugin.lua`)
2. Return a table with plugin spec(s):
```lua
return {
  {
    "author/plugin-name",
    opts = {
      -- configuration here
    },
  },
}
```
3. Restart Neovim or run `:Lazy sync`

### Modifying LSP Settings
- Python LSP config is in `lua/plugins/lspconfig.lua:8-49`
- Custom server setup uses the `setup` table with per-server functions
- Return `true` from setup function to prevent LazyVim's default setup

### File Type Detection
Custom filetype patterns are in `lua/config/options.lua:24-43`:
- `.env.*` → `sh`
- `*.config` → `yaml`
- `*.json` → `jsonc` (JSON with comments)

## Important Notes

- LSP logging is set to `OFF` (lua/config/lazy.lua:18) for performance
- Colorscheme is "kanagawa" with "sonokai espresso" as fallback
- Relative line numbers are disabled (lua/config/options.lua:4)
- Line breaks respect word boundaries (lua/config/options.lua:5)
- Git diffs use histogram algorithm with indent heuristics (lua/config/options.lua:15-22)
- Plugins always use latest git commit, not stable releases (lua/config/lazy.lua:47)
