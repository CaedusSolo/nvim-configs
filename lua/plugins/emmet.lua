return {
  "mattn/emmet-vim",
  ft = { "html", "css", "javascriptreact", "typescriptreact", "typescript", "javascript" },
  init = function()
    vim.g.user_emmet_leader_key = "s"

    -- Use React-style attributes
    vim.g.user_emmet_settings = {
      javascript = { extends = "jsx" },
      javascriptreact = { extends = "jsx" },
      typescriptreact = { extends = "jsx" },
      jsx = {
        attribute_name = {
          class = "className",
        },
      },
    }

    -- Place cursor inside element content instead of after </tag>
    vim.g.user_emmet_expandabbr_key = "<Plug>(emmet-expand-abbr)" -- default
    vim.g.user_emmet_install_global = 0
    vim.cmd([[
      autocmd FileType html,css,javascriptreact,typescriptreact,typescript,javascript EmmetInstall
    ]])

    -- This makes the cursor land inside the element (not after the closing tag)
    vim.g.user_emmet_expandabbr_position = "text"
  end,
}
