vim.lsp.config('lua_ls',{
  cmd = {"lua_ls"},
  filetypes = {"lua"},
  setting = {
    completion = {
      displayContext = 1
    }
  }
})

vim.lsp.enable('lua_ls')
