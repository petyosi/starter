return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["oxfmt"] = { require_cwd = true },
      },
      log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
        typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
        json = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
        jsonc = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
        css = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
        markdown = { "oxfmt", "markdownlint", "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
