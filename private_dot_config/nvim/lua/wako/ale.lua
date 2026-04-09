vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 1

vim.g.ale_linters = {
  javascript = {"standard"},
  json = {"eslint"},
  typescript = {"eslint"},
}

vim.g.ale_fixers = {
  javascript = {"standard"},
  json = {"eslint"},
  typescript = {"eslint"},
}

vim.g.ale_fixers["*"] = {"trim_whitespace", "remove_trailing_lines"}
