return {
  "ibhagwan/fzf-lua",
  enabled = false,
  keys = {
    { "<leader>/", "<cmd>FzfLua grep_project<cr>", desc = "Grep (Root dir)" },
    { "<leader>o", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>p", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  },
}
