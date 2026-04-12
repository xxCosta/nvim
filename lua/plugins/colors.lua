return {
  {
    'ThorstenRhau/token',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('token')
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    end,
  },
}
