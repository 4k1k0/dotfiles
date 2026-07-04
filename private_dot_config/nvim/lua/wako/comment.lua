require('mini.comment').setup({
  -- Options which control module behavior
  options = {
    -- Function to compute custom 'commentstring' (optional)
    custom_commentstring = nil,

    -- Whether to ignore blank lines when commenting
    ignore_blank_line = false,

    -- Whether to ignore blank lines in actions and textobject
    start_of_line = false,

    -- Whether to force single space inner padding for comment parts
    pad_comment_parts = true,
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Toggle comment on the current line (Normal mode)
    comment_line = '<Leader>c',

    -- Toggle comment on the current visual block (Visual mode)
    comment_visual = '<Leader>c',

    -- Optional: Disable the default operator-pending mapping ('gc') 
    -- if you solely want to rely on your <leader>c mapping.
    comment = '',
    
    -- Optional: Disable the default text object mapping ('gc')
    textobject = '',
  },

  -- Hook functions to be executed at certain stage of commenting
  hooks = {
    -- Before successful commenting. Does nothing by default.
    pre = function() end,
    -- After successful commenting. Does nothing by default.
    post = function() end,
  },
})
