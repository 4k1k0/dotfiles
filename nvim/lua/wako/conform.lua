require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "standardjs" } },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
