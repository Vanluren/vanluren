return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.terrafmt,
      },
    }
  end,
}