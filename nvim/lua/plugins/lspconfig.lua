-- lua/plugins/go.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- disable inlay hints globally
      opts.inlay_hints = { enabled = false }

      -- ensure tables exist
      opts.servers = opts.servers or {}
      opts.servers.gopls = opts.servers.gopls or {}
      opts.servers.gopls.settings = opts.servers.gopls.settings or {}

      -- merge gopls settings
      opts.servers.gopls.settings.gopls = vim.tbl_deep_extend("force", opts.servers.gopls.settings.gopls or {}, {
        buildFlags = { "-tags=integration" },
      })

      return opts
    end,
  },
}
