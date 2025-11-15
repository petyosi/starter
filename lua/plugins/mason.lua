return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "stylua",
        "lua-language-server",

        -- Shell
        "shfmt",

        -- Python
        "pyright",
        "ruff",
        "debugpy",

        -- JavaScript/TypeScript
        "vtsls",
        "biome",
        "oxlint",
        "prettier",
        "eslint-lsp",
        "js-debug-adapter",

        -- Web
        "astro-language-server",
        "css-lsp",
        "tailwindcss-language-server",

        -- JSON
        "json-lsp",

        -- Markdown
        "marksman",
        "markdownlint-cli2",
        "markdown-toc",

        -- AI
        "copilot-language-server",
      },
    },
  },
}
