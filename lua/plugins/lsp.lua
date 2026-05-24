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

    config = function()
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        -- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)     
      vim.api.nvim_create_autocmd("BufWritePre", {

        pattern = { "*" },
        callback = function()
          vim.lsp.buf.format()
        end

      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim"
              }
            }
          }
        }

      })
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("dockerls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("ts_ls")
    end,
  },
}
