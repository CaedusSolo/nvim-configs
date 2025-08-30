return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      dotfiles = false, -- false = show dotfiles by default
    },
    view = {
      width = 25, -- set file explorer width (default is 30)
      side = "left", -- can also be "right"
    },
  },
}
