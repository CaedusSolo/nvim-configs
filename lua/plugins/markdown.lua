return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown" },
  config = function()
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc"
    require("render-markdown").setup({})
  end,
}
