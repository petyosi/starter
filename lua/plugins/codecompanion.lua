return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op item get rcfbys54cj52wmntjqo37cqfry --fields label=credential --reveal --account YXHOJT3EYZCZNLY7MB474NM574",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
        keymaps = {
          accept_change = {
            modes = { n = "ca" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "cr" },
            description = "Reject the suggested change",
          },
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
