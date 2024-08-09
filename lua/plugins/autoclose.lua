return {
    {'m4xshen/autoclose.nvim',
        opts = {
            keys = {
                ["{"] = {escapse = true, close = true, pair = "{}"},
                ["("] = {escapse = true, close = true, pair = "()"}
            }
        }
    }
}
