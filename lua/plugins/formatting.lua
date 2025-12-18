return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["biome-check"] = { require_cwd = true },
      },
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "biome-check", "prettierd", "prettier", "oxfmt", stop_after_first = true },
        typescript = { "biome-check", "prettierd", "prettier", "oxfmt", stop_after_first = true },
        typescriptreact = { "biome-check", "prettierd", "prettier", "oxfmt", stop_after_first = true },
        json = { "biome-check", "prettier", "oxfmt", stop_after_first = true },
        jsonc = { "biome-check", "prettier", "oxfmt", stop_after_first = true },
        css = { "biome-check", "prettier", "oxfmt", stop_after_first = true },
        markdown = { "markdownlint", "prettier", stop_after_first = true },
      },
    },
  },
}
