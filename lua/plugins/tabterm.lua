return {
  {
    "kremovtort/tabterm.nvim",
    config = function()
      local tabterm = require("tabterm")
      vim.keymap.set("n", "<leader>tt", function()
        tabterm.toggle()
      end, { desc = "Toggle tabterm" })

      vim.keymap.set("n", "<leader>tr", function()
        tabterm.rename_active()
      end, { desc = "Rename current tabterm tab" })

      vim.keymap.set("n", "<leader>td", function()
        tabterm.rename_active()
      end, { desc = "Delete current tabterm tab" })

      vim.keymap.set("n", "<leader>tc", function()
        tabterm.rename_active()
      end, { desc = "Cycle tabterm tabs" })

      vim.keymap.set("n", "<leader>tp", function()
        tabterm.rename_active()
      end, { desc = "Cycle tabterm tabs(counterclockwise)" })

      vim.keymap.set("n", "<leader>tn", function()
        tabterm.new_shell()
      end, { desc = "New tabterm shell" })
    end
  },
}
