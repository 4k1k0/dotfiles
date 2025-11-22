require('telescope').load_extension('media_files')

require('telescope').setup{
  defaults = {
    -- ...
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      -- theme = "ivy",
      -- theme = "cursor",
    },
    git_files = {
      theme = "dropdown",
    },
    grep_string = {
      theme = "dropdown",
    }
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
