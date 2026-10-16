-- Run: nvim --headless -i NONE -c 'luafile tests/autosave.lua' -c 'qa!'
vim.api.nvim_exec_autocmds("User", { pattern = "VeryLazy" })

local file = vim.fn.tempname()
vim.fn.writefile({ "before" }, file)
vim.cmd.edit(vim.fn.fnameescape(file))
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "after leave" })
vim.cmd.enew()
assert(vim.fn.readfile(file)[1] == "after leave", "BufLeave did not save")

vim.cmd.edit(vim.fn.fnameescape(file))
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "after focus loss" })
vim.api.nvim_exec_autocmds("FocusLost", {})
assert(vim.fn.readfile(file)[1] == "after focus loss", "FocusLost did not save")

vim.cmd.enew()
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "unnamed" })
vim.api.nvim_exec_autocmds("FocusLost", {}) -- must not fail on unnamed buffers
vim.fn.delete(file)
print("autosave ok")
