return {
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        comfig = function()
            require('nordic').setup({
                transparent = {
                    bg = true,
                    float = true
                }
            })
            vim.cmd.colorscheme('nordic')
        end,
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'NLKNguyen/papercolor-theme',
    {'nvim-treesitter/nvim-treesitter',build = ':TSUpdate'},
    "nvim-lua/plenary.nvim", -- don't forget to add this one if you don't have it yet!
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    'mbbill/undotree',
    'mhinz/vim-signify',
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          {'neovim/nvim-lspconfig'},
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  },
  }
