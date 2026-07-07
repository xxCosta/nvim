return {
  {
    "kremovtort/tabterm.nvim",
    config = function()
      local tabterm = require("tabterm")
      vim.keymap.set("n", "tt", function()
        tabterm.toggle()
      end, { desc = "Toggle tabterm" })

      vim.keymap.set("n", "<leader>ttr", function()
        tabterm.rename_active()
      end, { desc = "Rename current tabterm tab" })

      vim.keymap.set("n", "<leader>ttd", function()
        tabterm.rename_active()
      end, { desc = "Delete current tabterm tab" })

      vim.keymap.set("n", "<leader>ttc", function()
        tabterm.rename_active()
      end, { desc = "Cycle tabterm tabs" })

      vim.keymap.set("n", "<leader>ttp", function()
        tabterm.rename_active()
      end, { desc = "Cycle tabterm tabs(counterclockwise)" })

      vim.keymap.set("n", "<leader>ttn", function()
        tabterm.new_shell()
      end, { desc = "New tabterm shell" })
    end
  },
}
