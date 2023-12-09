local o = vim.opt

o.termguicolors = true

o.listchars = {
  extends = '⟩',
  precedes = '⟨',
  space = '·',
  tab = '│·',
  trail = '·',
}

o.autoindent = true
o.autoread = true
o.backspace = "indent,eol,start"
o.colorcolumn = "80"
o.cursorcolumn = true
o.cursorline = true
o.encoding = "utf-8"
o.expandtab = true
o.hidden = true
o.laststatus = 3
o.list = true
o.number = true
o.relativenumber = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.updatetime = 50

vim.g.go_def_mode="gopls"
vim.g.go_info_mode="gopls"
-- vim.g.deoplete.enable_at_startup=1

vim.api.nvim_create_autocmd(
  { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" },
  {
    pattern = { "*" },
    command = "if mode() != 'c' | checktime | endif",
  }
)

