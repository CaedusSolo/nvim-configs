return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "dart", "lua", "json" },
    },
  },
}
