return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, position = "current", dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (full window)",
    },
  },
  opts = function(_, opts)
    opts.filesystem.hijack_netrw_behavior = "open_current"
    opts.open_files_do_not_replace_types = vim.tbl_filter(function(kind)
      return kind ~= "terminal"
    end, opts.open_files_do_not_replace_types)
  end,
}
