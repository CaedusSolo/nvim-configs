-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "fj", "<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":botright split | terminal<CR>", { noremap = true, silent = true })
