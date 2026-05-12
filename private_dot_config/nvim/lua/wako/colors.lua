--[[
--
-- These options are for the buffer tab.
--

  | Group                      | Meaning                             |
  | -------------------------- | ----------------------------------- |
  | `BufferLineFill`           | background behind the whole tabline |
  | `BufferLineBackground`     | unselected buffers                  |
  | `BufferLineBufferSelected` | active buffer                       |
  | `BufferLineTabSelected`    | active tab                          |
  | `BufferLineSeparator`      | separators                          |
  | `BufferLineNumbers`        | buffer numbers                      |

  For more highlight groups:
  https://neovim.io/doc/user/builtin.html#synIDattr()

  E.g.

  vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#1e1e1e" })

--
]]

function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3e4145" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3e4145" })
end

function ColorGruv()
  vim.o.background = "dark" -- or "light" for light mode

  -- Default options:
  require("gruvbox").setup({
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    bold = true,
    contrast = "hard", -- can be "hard", "soft" or empty string
    dim_inactive = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    overrides = {},
    palette_overrides = {},
    strikethrough = true,
    terminal_colors = true, -- add neovim terminal colors
    transparent_mode = false,
    undercurl = true,
    underline = true,
  })

  vim.opt.termguicolors = true
  vim.cmd.colorscheme("gruvbox")
end

-- ColorMyPencils()
ColorGruv()
