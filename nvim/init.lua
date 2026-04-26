-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.termguicolors = true
vim.cmd.highlight({ "Folded", "guibg=None" })
