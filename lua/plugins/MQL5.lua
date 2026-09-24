return {
  "foolofafitz/mql.nvim",
  -- ft = { "mq5", "mqh" }, -- Lazy load only on MQL filetypes
  ft = { "mql5", "mqh" }, -- Lazy load only on MQL filetypes
  opts = {
    -- REQUIRED: Absolute path to your Wine MetaEditor executable
    metaeditor_path = "/home/saucedbenny/.wine/drive_c/Program Files/CMC Markets MetaTrader 5 Terminal/MetaEditor64.exe",

    -- REQUIRED: Absolute path to your default MQL5 standard components/include library folder
    mql5_include_path = "/home/saucedbenny/.wine/drive_c/Program Files/CMC Markets MetaTrader 5 Terminal/MQL5",

    -- OPTIONAL: Default mapping to trigger compilation (set to `false` to disable)
    bind_key = "<F7>",
  }
}
