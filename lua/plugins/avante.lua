return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make BUILD_FROM_SOURCE=true",
  enabled = false,
  -- commit = "58e0165",
  opts = {
    provider = "claude",
    claude = {
      api_key_name = "cmd:op item get rcfbys54cj52wmntjqo37cqfry --fields label=credential --reveal --account YXHOJT3EYZCZNLY7MB474NM574",
    },
    behavior = {
      auto_suggestions = false,
    },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "Avante" },
      },
      ft = { "Avante" },
    },
  },
}
