return {
  {
    "yetone/avante.nvim",
    enabled = false,
    -- commit = "104484f17c9b8908ca190cb471c48772d7025a8e",
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      provider = "copilot",
      mappings = {
        ask = "<leader>av",
      },
      behavior = {
        auto_suggestions = true,
      },
      -- add any opts here
    },
    dependencies = {
      "echasnovski/mini.icons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
  },
}
