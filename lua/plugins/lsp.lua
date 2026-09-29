return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = { "lua_ls", "clangd", "dockerls", "bashls", "ts_ls" },
    },

    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.rename)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*" },
        callback = function()
          vim.lsp.buf.format()
        end
      })

      vim.filetype.add({
        extension = {
          mq4 = "mql4",
          mq5 = "mql5",
          mqh = "mql5",
        },
      })

      vim.lsp.config("mql5-lsp", {
        name = "mql5-lsp",
        cmd = { "/home/saucedbenny/Documents/LSPS/mql5-lsp" },
        root_dir = vim.fs.dirname(vim.fs.find({ "MQL5" }, { upward = true })[1]),
        filetypes = { "mql5", "mql4" },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.enable("mql5-lsp")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("dockerls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("ts_ls")
    end,
  },
}
