vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()
require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    group_empty = true,
  },
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    relativenumber = true,
  },
  sort_by = "case_sensitive",
})


vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle)
