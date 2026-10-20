return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem.hijack_netrw_behavior = "open_current"
    opts.open_files_do_not_replace_types = vim.tbl_filter(function(kind)
      return kind ~= "terminal"
    end, opts.open_files_do_not_replace_types)
  end,
}
