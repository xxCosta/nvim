

return {
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/plugins/snippets"})
        end
    }
}

