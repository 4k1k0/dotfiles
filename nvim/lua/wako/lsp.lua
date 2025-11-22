local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'elixirls',
    'elp',
    'gopls',
    'lua_ls',
    'marksman',
    'ts_ls',
  },
})

-- Golang settings
require('lspconfig').gopls.setup({
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true
    }
  }
})

-- Rust settings
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      local lsp_zero = require('lsp-zero')

      -- 1. Apply lsp-zero keymaps
      lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })

      -- 2. Comprehensive Auto-Actions Autocommand
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("RustAutoActions", { clear = true }),
        buffer = bufnr,
        callback = function()
          -- Always run auto-format (rustfmt) first
          vim.lsp.buf.format({ async = false, timeout_ms = 1000 })

          -- Run auto-import/organize imports using a broader context
          vim.lsp.buf.code_action({
            context = {
              -- Request both 'fixAll' and 'organizeImports' for better reliability
              only = { 'source.fixAll', 'source.organizeImports' }, 
              diagnostics = {} 
            },
            apply = true,
            -- Increase timeout slightly to ensure the server completes the action
            timeout_ms = 2000, 
            -- Filter to ensure we only apply source actions
            filter = function(action)
              return action.kind:match('^source%.')
            end
          })
        end,
      })
    end,
    -- ... (rest of default_settings remains the same) ...
  },
}

-- General settings
lsp_zero.setup_servers({
  'bashls',
  'elixirls',
  'elp',
  'gopls',
  'lua_ls',
  'marksman',
  'ts_ls',
})

---
-- Completition
---

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

--- Aesthetics

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})
