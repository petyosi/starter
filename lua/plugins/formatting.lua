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
        javascript = { "prettier", "biome-check", stop_after_first = true },
        typescript = { "prettier", "biome-check", stop_after_first = true },
        typescriptreact = { "prettier", "biome-check", stop_after_first = true },
        json = { "prettier", "biome-check", stop_after_first = true },
        jsonc = { "prettier", "biome-check", stop_after_first = true },
      },
    },
  },
}
