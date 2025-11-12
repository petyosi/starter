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
        javascript = { "biome-check", "oxfmt", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome-check", "oxfmt", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "biome-check", "oxfmt", "prettierd", "prettier", stop_after_first = true },
        json = { "biome-check", "oxfmt", "prettierd", "prettier", stop_after_first = true },
        jsonc = { "biome-check", "oxfmt", "prettierd", "prettier", stop_after_first = true },
        css = { "biome-check", "oxfmt", "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", "markdownlint-cli2", stop_after_first = false },
      },
    },
  },
}
