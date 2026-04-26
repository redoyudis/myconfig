return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.snippet = {
      expand = function(args)
        -- do nothing, disables snippet expansion
      end,
    }
    return opts
  end,
}
