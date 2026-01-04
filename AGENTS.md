# AGENTS.md

This document guides AI agents working in this Neovim configuration repository.

## Build/Lint/Test Commands

### Neovim Configuration

```bash
# Check Lua syntax and formatting
stylua check lua/

# Format Lua code
stylua write lua/

# Sync plugins (after config changes)
nvim -c ":Lazy sync" -c ":q"

# Check for plugin updates
nvim -c ":Lazy" -c ":q"

# Update Neovim plugins
nvim -c ":Lazy update" -c ":q"
```

### Working on Neovim Projects

```bash
# Run single test with neotest (cursor over test)
:Neotest run

# Run all tests in file
:Neotest run file

# Run nearest test
:Neotest run nearest

# Run tests at cursor position
:Neotest run at

# Watch tests
:Neotest watch
```

## Code Style Guidelines

### Lua Configuration Files

**Indentation & Formatting**

- 2 spaces indentation
- 120 character line width
- Use stylua for automatic formatting
- Trailing commas in multi-line tables for cleaner diffs

**File Structure**

```
lua/
  config/        # Core configuration (options, keymaps, autocmds)
  plugins/       # Plugin specifications (each file = one or more plugins)
```

**Plugin Specifications**
Each file in `lua/plugins/` returns a table with plugin specs:

```lua
return {
  {
    "author/plugin-name",
    enabled = true,
    opts = { -- configuration },
    keys = { -- keybindings },
    dependencies = { -- dependencies },
  },
}
```

**Keymaps**

- Use `vim.keymap.set()` with explicit modes: `"n"`, `"v"`, `"i"`, `"t"`, `"x"`
- Include descriptive desc field for which-key
- Silent mode for non-query commands: `{ silent = true }`
- Function values wrapped in `function() ... end` for multiline

**Options & Autocmds**

- Options: `vim.opt.option = value` or `vim.o.option = value`
- Autocmds: `vim.api.nvim_create_autocmd({ events }, { pattern, callback })`
- Use local helper functions for complex logic

**Type Annotations**

- Use EmmyLua annotations for LSP: `---@class`, `---@type`, `---@param`
- Annotate opts tables for LazyVim plugin specs

**Comments**

- Write comments only when they explain *why*, not *what*
- No section labels (e.g., "// Options")
- No step numbers
- Don't restate what the code clearly expresses

**Error Handling**

- Check file existence before operations: `vim.fn.filereadable(path) == 1`
- Use `vim.schedule()` for notifications in async callbacks
- Check shell errors: `vim.v.shell_error ~= 0`

**Naming Conventions**

- Plugin files: kebab-case (e.g., `lspconfig.lua`, `nvim-lint.lua`)
- Local functions: snake_case
- Vim global vars: `vim.g.variable_name`
- Plugin opts: nested tables matching plugin structure

**Disabled Code**

- Comment out with `--` prefix, preserve for future reference
- Example: `-- { import = "lazyvim.plugins.extras.formatting.biome" }`

### LSP Configuration

**Server Setup**

- Configure servers in `lua/plugins/lspconfig.lua` under `opts.servers`
- Use `setup` table for custom server initialization
- Return `true` from setup function to bypass LazyVim defaults
- Disable hover for duplicate functionality (e.g., ruff_lsp)

**Python LSP**

- Pyright for type checking with basic mode
- Ruff for fast linting (hover disabled)
- Pylsp as fallback with pycodestyle overrides

### Formatting Strategy

**Formatter Priority** (first available wins):

- JavaScript/TypeScript: oxfmt → biome-check → prettierd → prettier
- Python: ruff_format + ruff_organize_imports
- JSON/CSS: oxfmt → biome-check → prettier
- Markdown: oxfmt → markdownlint → prettier

**Key Commands**

- Format current buffer: `<Leader>f`
- Check formatter status: `:ConformInfo`
- Auto-format on save: enabled when `vim.g.lazyvim_eslint_auto_format = true`

## Important Patterns

**Plugin Lazy Loading**

- Custom plugins: `lazy = false` by default (load on startup)
- Use `version = false` to always use latest git commit

**LSP Performance**

- LSP logging: `OFF` level set in `lua/config/lazy.lua:18`
- Disable unused RTP plugins in performance config

**AI Integration**

- Primary: Sidekick via tmux (`<c-.>`, `<leader>aa`)
- Tab key: Jump/apply edit suggestions from Sidekick
- Send contexts: `{this}`, `{file}`, `{selection}` for focused AI

**File Type Detection**

- `.env.*` → `sh`
- `*.config` → `yaml`
- `*.json` → `jsonc` (JSON with comments)

**Colorscheme**

- Primary: kanagawa
- Fallback: sonokai espresso (with transparent background)

## Common Pitfalls

- Don't add inline comments explaining function names
- Avoid verbose comments in favor of clear code structure
- Don't mix `vim.opt` and `vim.o` for the same option
- Remember to update LazyVim extras when adding language support
- Always restart Neovim or run `:Lazy sync` after plugin changes
