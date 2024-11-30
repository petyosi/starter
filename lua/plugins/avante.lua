return {
  {
    "yetone/avante.nvim",
    enabled = true,
    lazy = false,
    version = false,
    build = "make BUILD_FROM_SOURCE=true",
    commit = "58e0165",
    event = "VeryLazy",
    opts = {
      provider = "claude",
      claude = {
        api_key_name = "cmd:op item get rcfbys54cj52wmntjqo37cqfry --fields label=credential --reveal --account YXHOJT3EYZCZNLY7MB474NM574",
      },
      behavior = {
        auto_suggestions = false,
      },
      -- add any opts here
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
