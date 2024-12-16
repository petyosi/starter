return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = false,
      keymap = {
        accept = "<C-j>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false, auto_refresh = false },

    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
