return {
  "esmuellert/vscode-diff.nvim",
  branch = "next",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  config = function()
    require("vscode-diff").setup({
      -- Keymaps in diff view
      keymaps = {
        view = {
          quit = "q", -- Close diff tab
          toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
          next_hunk = "]c", -- Jump to next change
          prev_hunk = "[c", -- Jump to previous change
          next_file = "]f", -- Next file in explorer mode
          prev_file = "[f", -- Previous file in explorer mode
          diff_get = "do", -- Get change from other buffer (like vimdiff)
          diff_put = "dp", -- Put change to other buffer (like vimdiff)
        },
        explorer = {
          select = "<CR>", -- Open diff for selected file
          hover = "K", -- Show file diff preview
          refresh = "R", -- Refresh git status
          toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
        },
      },
    })
  end,
}
