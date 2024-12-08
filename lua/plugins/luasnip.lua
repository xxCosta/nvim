
return {
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            ls.add_snippets("all", {
                s({trig="tester",name="testing"},{
                    t("-- hello")
                })
            })
        end
    }
}












