return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
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
