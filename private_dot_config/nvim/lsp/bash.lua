vim.lsp.config('bashls',{
  cmd = { "bash-language-server", "start" },
  filetypes = {"bash", "shell"},
  settings = {

  }
})

vim.lsp.enable('bashls')
