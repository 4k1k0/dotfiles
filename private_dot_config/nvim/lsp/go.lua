vim.lsp.config('gopls',{
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_markers = {"go.mod","go.sum"},
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      semanticTokens = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true
    }
  }
})
vim.lsp.enable('gopls')
