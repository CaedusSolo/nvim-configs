return {
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,      
    priority = 1000,   
    opts = {
      transparent_background = false,
    },          
    config = function(_, opts)
      require("tokyodark").setup(opts)  
      vim.cmd.colorscheme("tokyodark")  
    end,
  },
}
