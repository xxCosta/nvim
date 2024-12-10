local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
ls.add_snippets("lua", {
    s("local", fmt("local {} = require('{}')", {
       i(1, "var_name"), i(2, "package_name")
    }))
})

