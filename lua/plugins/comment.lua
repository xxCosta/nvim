return {
  {
    'nvim-mini/mini.comment',
    version = false,
    opts = {
      options = {
        custom_commentstring = function()
          if (vim.bo.filetype == "mql5") then
            return "// %s"
          end
        end,
        ignore_blank_lines = true
      }
    }
  },
}
