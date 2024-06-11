local Util = require("lazyvim.util")

return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    init = function()
      vim.keymap.set("n", "<A-l>", "<cmd>0G<cr>", { silent = true })
    end,
  },
  {
    "tpope/vim-rhubarb",
    lazy = false,
    init = function()
      local my_rhubarb = vim.api.nvim_create_augroup("my_rhubarb", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gitcommit" },
        callback = function()
          vim.opt.completefunc = "rhubarb#Complete"
        end,
        group = my_rhubarb,
      })
    end,
  },
  { "tpope/vim-eunuch", lazy = false },
  { "tpope/vim-surround" },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        tmux = { enabled = true }, -- disables the tmux statusline
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {
          init_options = {
            preferences = {
              quoteStyle = "double",
            },
          },
        },
        biome = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
    enabled = false,
  },
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        -- "flake8",
      },
    },
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    version = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function()
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        end, { "i", "s" }),
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
      { "<Leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
      { "<Leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
      { "<Leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
      { "<Leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
      { "<Leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
      { "<Leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
      { "<Leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
      { "<Leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<Leader>p", Util.telescope("files"), desc = "Find files (root dir)" },
      { "<Leader>o", Util.telescope("buffers"), desc = "Open buffers" },
      {
        "<leader>sS",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
            "Variable",
            "Type",
          },
        }),
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
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "kdheepak/lazygit.nvim",
    enabled = false,
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
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
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      -- { "<leader>d", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "folke/flash.nvim",
    enabled = false,
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },
  {
    "prisma/vim-prisma",
    lazy = false,
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<Leader>p", false },
    },
  },
}
