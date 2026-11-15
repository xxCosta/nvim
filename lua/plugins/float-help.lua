return {
  "guruela/float-help.nvim",
  opts = {}, -- Equivalent to require('float-help').setup(opts)
  init = function()
    vim.keymap.set("n", "<leader>hh", "<cmd>Fh<cr>", {
      desc = "Toggle floating help",
    })
  end,
}
