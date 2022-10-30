
vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 's1n7ax/nvim-terminal' -- terminal popup window helper
  use 'whitemilan/minimap.nvim' -- minimap plugin 
  use { -- tree display complement
    'kyazdani42/nvim-tree.lua',
    requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use { -- treesitter for syntax highlight
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { -- autopairs for automatically closing ({ etc.
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips',
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        }
    }
end)
