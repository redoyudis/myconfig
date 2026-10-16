-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function autosave(buf)
  if vim.bo[buf].modified and vim.bo[buf].buftype == "" and not vim.bo[buf].readonly and vim.api.nvim_buf_get_name(buf) ~= "" then
    vim.api.nvim_buf_call(buf, function()
      vim.cmd("update")
    end)
  end
end

vim.api.nvim_create_autocmd("BufLeave", {
  callback = function(event)
    autosave(event.buf)
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        autosave(buf)
      end
    end
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end,
})
