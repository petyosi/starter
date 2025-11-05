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
  },
  {
    "sindrets/diffview.nvim",
    enabled = true,
    init = function()
      local diffview = require("diffview")
      local lazy = require("diffview.lazy")
      local arg_parser = lazy.require("diffview.arg_parser") ---@module "diffview.arg_parser"
      -- NOTE: Need this wrapper around the completion function becuase it doesn't
      -- exist yet.
      local function completion(...)
        return diffview.completion(...)
      end

      vim.api.nvim_create_user_command("Dfo", function(ctx)
        diffview.open(arg_parser.scan(ctx.args).args)
      end, { nargs = "*", complete = completion })
    end,
  },
}
