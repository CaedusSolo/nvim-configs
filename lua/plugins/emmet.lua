return {
  "mattn/emmet-vim",
  ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  init = function()
    vim.g.user_emmet_settings = {
      javascript = { extends = "jsx" },
      typescript = { extends = "jsx" },
      javascriptreact = { extends = "jsx" },
      typescriptreact = { extends = "jsx" },
      jsx = {
        attribute_name = {
          class = "className",
          ["for"] = "htmlFor",
        },
      },
    }
    vim.g.user_emmet_expandabbr_position = "text"
    
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      command = "EmmetInstall",
    })
  end,
  keys = {
    { "<leader>ss", mode = "i", "<Plug>(emmet-expand-abbr)", desc = "Emmet expand" },
    { "<leader>ss", mode = "v", "<Plug>(emmet-wrap-with-abbreviation)", desc = "Emmet wrap" },
  },
}