local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
ls.add_snippets("all", {
    s("asdftester",{
        t({"-- hello", "-- goodbye"}),
        i(1, "insert")
    })
})


