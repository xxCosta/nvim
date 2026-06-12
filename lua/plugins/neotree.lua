return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function(_)
    vim.keymap.set("n", "<leader>rw", ":Neotree position=current<CR>")
  end,
  opts = {
    filesystem = {
      filtered_items = {
        -- when true, they will just be displayed differently than normal items
        visible = true,
        -- whether children of filtered parents should inherit their parent's highlight group
        children_inherit_highlights = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false, -- hide files that are ignored by other gitignore-like files
        -- other gitignore-like files, in descending order of precedence.
        hide_hidden = false,  -- only works on Windows for hidden files/directories
      },
    }
  },
}
