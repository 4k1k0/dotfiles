require'nvim-treesitter'.setup {
  ensure_installed = {
    "c",
    "elixir",
    "erlang",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "heex",
    "lua",
    "rust",
    "typescript",
    "vim",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "lua", "rust" }, -- Add other languages as needed
  callback = function()
    vim.treesitter.start()
  end,
})
