local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<Leader>p", Util.pick("files"), desc = "Find files (root dir)" },
      { "<Leader>o", Util.pick("buffers"), desc = "Open buffers" },
      {
        "<leader>sS",
        function()
          require("telescope.builtin").lsp_workspace_symbols({
            symbols = LazyVim.config.get_kind_filter(),
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep (root dir)",
      },
    },
    opts = function()
      local lga_actions = require("telescope-live-grep-args.actions")

      return {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    init = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<A-j>",
        function()
          require("neo-tree.command").execute({ dir = require("lazyvim.util").root.get() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
    opts = {
      window = {
        mappings = {
          ["o"] = "toggle_node",
        },
      },
    },
  },
}
