vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use ('wbthomason/packer.nvim')

  -- Core Plugins (UI, Utilities)
  use ({ 'catppuccin/nvim', as = 'catppuccin' })
  use { "ellisonleao/gruvbox.nvim" }
  use ({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} })
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')
  use('nvim-lua/plenary.nvim') -- Define Plenary once here

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {
      {'BurntSushi/ripgrep'},
      {'nvim-lua/popup.nvim'},
      {'nvim-telescope/telescope-media-files.nvim'},
    }
  }

  -- UI/Aesthetics
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use ({'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'})

  -- Language-Specific
  use('fatih/vim-go', { run = ':GoUpdateBinaries' })
  use('rust-lang/rust.vim')
  use('elixir-editors/vim-elixir')
  use('tpope/vim-commentary')

  -- LSP CORE (Define these once and up front)
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'L3MON4D3/LuaSnip'} -- Snippets
  use {'mfussenegger/nvim-lint'} -- Linters

  -- Completion CORE (Required by lsp-zero)
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}


  -- LSP CLIENT MANAGERS
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
  }

  use({
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false, -- Critical for early load
  })

  -- Old/Deprecated Plugins (Consider replacement)
  use('Shougo/deoplete.nvim', { run = ':UpdateRemotePlugins' })
end)
