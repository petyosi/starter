return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["biome-check"] = { require_cwd = true },
        ["oxfmt"] = { require_cwd = true },
      },
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "oxfmt", "biome-check", "prettierd", "prettier", "oxfmt", stop_after_first = true },
        typescript = { "oxfmt", "biome-check", "prettierd", "prettier", "oxfmt", stop_after_first = true },
        typescriptreact = { "oxfmt", "biome-check", "prettierd", "prettier", "oxfmt", stop_after_first = true },
        json = { "oxfmt", "biome-check", "prettier", "oxfmt", stop_after_first = true },
        jsonc = { "oxfmt", "biome-check", "prettier", "oxfmt", stop_after_first = true },
        css = { "oxfmt", "biome-check", "prettier", "oxfmt", stop_after_first = true },
        markdown = { "oxfmt", "markdownlint", "prettier", stop_after_first = true },
      },
    },
  },
}
