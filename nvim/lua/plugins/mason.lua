require("lspconfig").gopls.setup({
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" }, -- Add your build tags here
    },
  },
})
