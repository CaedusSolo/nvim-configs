-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard = "unnamedplus"
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })  -- Make the cursor line more transparent


return {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = [[<leader>ft]], -- default toggle key
    direction = "horizontal",      
    start_in_insert = false,        
  },
}
