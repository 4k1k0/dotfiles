vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use ('wbthomason/packer.nvim')
  use ({ 'catppuccin/nvim', as = 'catppuccin' })
  use ({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} })
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'},
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use ({'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'})

  use('fatih/vim-go', { run = ':GoUpdateBinaries' })
  use('elixir-editors/vim-elixir')
  use('tpope/vim-commentary')
  use('Shougo/deoplete.nvim', { run = ':UpdateRemotePlugins' })
  -- use('dense-analysis/ale')

  -- LSP
  -- 
  --
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},

      -- Linters Support
      {'mfussenegger/nvim-lint'},
    }
  }
end)
