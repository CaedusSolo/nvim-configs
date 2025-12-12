return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",

      -- Make sure cmp is loaded BEFORE flutter-tools
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Safe capability loading (prevents cmp_nvim_lsp not found error)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp.default_capabilities(capabilities)
      end

      require("flutter-tools").setup({
        lsp = {
          color = { enabled = true },
          on_attach = function(client, bufnr) end,
          capabilities = capabilities,
        },
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
  },

  {
    "mason-org/mason-lspconfig.nvim", -- This repo name stays the same
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "dartls" },
      })

      -- Same safe capability handling here
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp.default_capabilities(capabilities)
      end

      require("lspconfig").dartls.setup({
        capabilities = capabilities,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "dart", "lua", "json" },
    },
  },
}
