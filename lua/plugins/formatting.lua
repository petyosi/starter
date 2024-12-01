return {
  {
    "stevearc/conform.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "biome-check", "prettier", stop_after_first = true },
        typescript = { "biome-check", "prettier", stop_after_first = true },
        typescriptreact = { "biome-check", "prettier", stop_after_first = true },
      },
    },
  },
}
