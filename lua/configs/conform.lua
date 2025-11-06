local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    ["clang-format"] = {
      prepend_args = {
        "--style={IndentWidth: 4, TabWidth: 4, UseTab: Never, ColumnLimit: 0}",
      },
    },
  },
}

return options
