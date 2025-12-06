local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('elixirls',{
  filetypes = {"elixir", "heex", "ex", "exs"},
  root_markers = {"mix.exs",".git"},
  settings = {
    capabilities = capabilities,
    elixirLS = {
      dialyzerDisabled = true,
      fetchDeps = false,
    }
  }
})

-- vim.lsp.enable('elixirls')
