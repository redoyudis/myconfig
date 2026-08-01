return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    opts.winopts = vim.tbl_deep_extend("force", opts.winopts or {}, {
      preview = {
        layout = "vertical",
        vertical = "up:45%",
      },
    })
    return opts
  end,
}
