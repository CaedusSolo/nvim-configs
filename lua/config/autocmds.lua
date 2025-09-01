-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- Cursor line dim
local function dim_ui_highlights()
  vim.api.nvim_set_hl(0, "CursorLine",     { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, "CursorLineNr",   { fg = "#888888", bold = true })
  vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "#1a1a1a" })
end

dim_ui_highlights()

vim.api.nvim_create_autocmd({ "ColorScheme", "User" }, {
  pattern = { "*", "VeryLazy" },
  callback = dim_ui_highlights,
})

-- Configure ibl.nvim after it initializes
vim.api.nvim_create_autocmd("User", {
  pattern = "IblAfterInit",
  callback = function()
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a2a", nocombine = true })
    vim.api.nvim_set_hl(0, "IblScope",  { fg = "#444444", nocombine = true })

    require("ibl").setup({
      indent = { char = "┊" }, 
      scope = { enabled = true },
    })
  end,
})
