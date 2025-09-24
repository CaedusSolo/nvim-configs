return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "lua",
        "vim",
        "javascript",
        "typescript",
        "html",
        "css",
      })
      require("nvim-treesitter.install").prefer_git = true
    end,
  },
}
