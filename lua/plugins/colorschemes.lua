return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,     -- load immediately
    priority = 1000,  -- load first
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
        },
      })
      vim.cmd("colorscheme github_dark_default") 
    end,
  },
}
