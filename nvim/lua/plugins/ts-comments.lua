return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  ft = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "html",
    "graphql",
  },
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
