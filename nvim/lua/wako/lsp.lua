require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'elp',
    'elixirls',
    'gopls',
    'lua_ls',
    'marksman',
    'rust_analyzer',
    'ts_ls',
  },
})
