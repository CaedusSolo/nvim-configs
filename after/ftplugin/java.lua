local home = os.getenv("USERPROFILE")
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = mason_path .. "/config_win"
local lombok_path = mason_path .. "/lombok.jar"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. project_name

-- --- NEW SECTION: Define Capabilities for Autocomplete ---
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  -- This tells JDTLS that we support cmp's specific features
  capabilities = cmp_nvim_lsp.default_capabilities()
end
-- ---------------------------------------------------------

local cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-Xmx1g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  "-javaagent:" .. lombok_path,
  "-jar",
  launcher_jar,
  "-configuration",
  config_path,
  "-data",
  workspace_dir,
}

local status, lsp = pcall(require, "lspconfig")
if status then
  lsp.jdtls.setup({
    cmd = cmd,
    root_dir = lsp.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml"),

    -- IMPORTANT: Pass the capabilities here!
    capabilities = capabilities,

    on_attach = function(client, bufnr)
      print("JDTLS Attached with Autocomplete!")
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    end,
  })
end
