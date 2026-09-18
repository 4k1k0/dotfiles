require("autoreload").setup({
  autoread = true,
  events = { "BufEnter", "FocusGained" },
  timer = {
    enabled = true,
    interval_ms = 3000,
    start_delay_ms = 0,
  },
  conflict = {
    -- How to handle a disk change that collides with unsaved buffer edits:
    --   "prompt" - blocking modal dialog you must answer to proceed
    --   "notify" - non-blocking warning notification (default)
    --   "none"   - keep the buffer silently, do nothing
    strategy = "notify",
    -- Actions offered (and their order) in the "prompt" dialog.
    actions = { "reload", "keep", "diff" },
    -- Action used when the dialog is dismissed with <Esc>.
    default = "keep",
  },
  notify = {
    on_conflict = true,
    on_reload = true,
  },
})
