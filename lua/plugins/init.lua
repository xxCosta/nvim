return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  "nvim-lua/plenary.nvim", -- don't forget to add this one if you don't have it yet!
  'mbbill/undotree',
  'mhinz/vim-signify',
  'tpope/vim-fugitive',
}
