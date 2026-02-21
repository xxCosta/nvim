return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },

    opts = {
      ensure_installed = { "lua_ls", "clangd" },

    },
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()



      vim.lsp.config("lua_ls",{
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

      vim.lsp.config("clangd", {
        -- capabilities = capabilities,
        cmd = {
          "clangd",
          "--header-insertion=never",
          "--query-driver=*",
          "--compile-commands-dir=.",
        },
        filetypes = { "c", "cpp" },
      })
    end,
  },
}

