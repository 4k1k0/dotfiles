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
    requires = { 'nvim-tree/nvim-web-devicons' }
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
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- LSP CORE (Define these once and up front)
  use {'neovim/nvim-lspconfig'}
  use {'mason-org/mason.nvim'}
  use {'mason-org/mason-lspconfig.nvim'}
  use {'L3MON4D3/LuaSnip'} -- Snippets
  use {'mfussenegger/nvim-lint'} -- Linters

  -- Completion CORE.
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/nvim-cmp'}
  use {'neovim/nvim-lspconfig'}

  use({
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false, -- Critical for early load
  })

  -- Old/Deprecated Plugins (Consider replacement)
  use('Shougo/deoplete.nvim', { run = ':UpdateRemotePlugins' })
end)
