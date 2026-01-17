-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "fj", "<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":botright split | terminal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus File Explorer" }) -- Toggle File Explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

vim.keymap.set("n", "<leader>mr", function()
  require("render-markdown").toggle()
end, { desc = "Toggle Markdown rendering" })

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

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode: Tab indents, Shift-Tab unindents
map("n", "<Tab>", ">>", opts)
map("n", "<S-Tab>", "<<", opts)

-- Visual mode: Tab indents selection, Shift-Tab unindents (keeps selection active)
map("v", "<Tab>", ">gv", opts)
map("v", "<S-Tab>", "<gv", opts)

-- Insert mode: Shift-Tab unindents one level
map("i", "<S-Tab>", "<C-d>", opts)
