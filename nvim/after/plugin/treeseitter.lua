require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "c", "elixir", "erlang", "go", "rust", "lua", "vim", "help", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
