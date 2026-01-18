return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            -- Mason core
            require("mason").setup()

            -- Only install clangd + lua_ls
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd" },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- lua_ls (simple)
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- clangd (your custom config)
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                    "--compile-commands-dir=.",
                },
            })
        end,
    },
}

