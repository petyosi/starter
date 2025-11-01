local cfg_path = os.getenv("HOME") .. "/.markdownlint.yaml"

return {
  "mfussenegger/nvim-lint",
  optional = true,
  cond = function()
    if vim.fn.filereadable(cfg_path) == 1 then
      return true
    else
      vim.schedule(function()
        vim.notify(
          string.format(
            "[nvim-lint] Skipping markdownlint-cli2 setup — expected config file not found at:\n%s",
            cfg_path
          ),
          vim.log.levels.WARN
        )
      end)
      return false
    end
  end,
  opts = {
    linters = {
      -- https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-10178217
      ["markdownlint-cli2"] = {
        args = { "--config", cfg_path, "--" },
      },
    },
  },
}
