-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "fj", "<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":botright split | terminal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus File Explorer" })-- Toggle File Explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Map 'nn' in terminal mode to exit to Normal mode
vim.keymap.set("t", "nn", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>fm", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ async = true, lsp_fallback = true })
  else
    vim.lsp.buf.format({ async = true })
  end
end, { desc = "Format file" })