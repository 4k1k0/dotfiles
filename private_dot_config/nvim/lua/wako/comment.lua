
require('Comment').setup(
  {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>c',
        ---Block-comment toggle keymap
        block = '<leader>C',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<leader>c',
        ---Block-comment keymap
        block = '<leader>C',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
  }
)

local ft = require('Comment.ft')

ft.go = {'//%s', '//%s'}
ft.javascript = {'//%s', '/*%s*/'}
ft.yaml = '#%s'
ft.rust = {'//%s', '/*%s*/'}
ft.typescript = {'//%s', '/*%s*/'}
ft.elixir = {'#%s', '#%s'}
ft.erlang = {'%% %s', '%% %s'}
ft.gleam = {'//%s', '//%s'}
ft.lua = {'--%s', '--[[%s]]'}
ft.sh = {'#%s', '#%s'}
ft.python = {'#%s', '#%s'}
ft.haskell = {'--%s', '{-%s-}'}
