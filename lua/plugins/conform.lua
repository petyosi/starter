return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        javascript = { { "biome-check", "prettierd", "prettier" } },
        typescript = { { "biome-check", "prettierd", "prettier" } },
        typescriptreact = { { "biome-check", "prettierd", "prettier" } },
        json = { { "biome-check", "prettierd", "prettier" } },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "biome-check" },
        scss = { "biome-check" },
        less = { "biome-check" },
        graphql = { "prettier" },
        rust = { "rustfmt" },
        go = { "gofmt", "goimports" },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        swift = { "swiftformat" },
        php = { "phpcbf" },
        ruby = { "rufo" },
        elixir = { "mix format" },
        erlang = { "erlfmt" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        lua = { "luacheck" },
        sh = { "shellcheck" },
        javascript = { "eslint", "biomejs" },
        typescript = { "eslint", "biomejs" },
        typescriptreact = { "eslint", "biomejs" },
        json = { "biomejs" },
        yaml = { "yamllint" },
        markdown = { "markdownlint" },
        css = { "biomejs" },
        scss = { "biomejs" },
        less = { "biomejs" },
      },
      linters = {
        biomejs = {
          condition = function(ctx)
            return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
