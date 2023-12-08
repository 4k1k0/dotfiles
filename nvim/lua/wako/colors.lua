function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3e4145" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3e4145" })
end

ColorMyPencils()
