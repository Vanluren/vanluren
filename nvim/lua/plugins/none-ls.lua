return {
 -- none-ls-autoload.nvim [mason package loader]
  -- https://github.com/zeioth/mason-none-ls.nvim
  -- This plugin auto starts the packages installed by Mason
  -- every time Neovim trigger the event FileType ().
  -- By default it will use none-ls builtin sources.
  -- But you can add external sources if a mason package has no builtin support.
  {
    "zeioth/none-ls-autoload.nvim",
    event = "User BaseFile",
    dependencies = {
      "williamboman/mason.nvim",
      "zeioth/none-ls-external-sources.nvim"
    },
    opts = {
      -- Here you can add support for sources not oficially suppored by none-ls.
      external_sources = {
        -- diagnostics
        'none-ls-external-sources.diagnostics.cpplint',
        'none-ls-external-sources.diagnostics.eslint',
        'none-ls-external-sources.diagnostics.eslint_d',
        'none-ls-external-sources.diagnostics.flake8',
        'none-ls-external-sources.diagnostics.luacheck',
        'none-ls-external-sources.diagnostics.psalm',
        'none-ls-external-sources.diagnostics.shellcheck',
        'none-ls-external-sources.diagnostics.yamllint',

        -- formatting
        'none-ls-external-sources.formatting.autopep8',
        'none-ls-external-sources.formatting.beautysh',
        'none-ls-external-sources.formatting.easy-coding-standard',
        'none-ls-external-sources.formatting.eslint',
        'none-ls-external-sources.formatting.eslint_d',
        'none-ls-external-sources.formatting.jq',
        'none-ls-external-sources.formatting.latexindent',
        'none-ls-external-sources.formatting.reformat_gherkin',
        'none-ls-external-sources.formatting.rustfmt',
        'none-ls-external-sources.formatting.standardrb',
        'none-ls-external-sources.formatting.yq',
      },
    },
  },

  -- none-ls [lsp code formatting]
  -- https://github.com/nvimtools/none-ls.nvim
  {
    "nvimtools/none-ls.nvim",
    event = "User BaseFile",
    opts = function()
      local builtin_sources = require("null-ls").builtins

      -- You can customize your 'builtin sources' and 'external sources' here.
      builtin_sources.formatting.shfmt.with({
        command = "shfmt",
        args = { "-i", "2", "-filename", "$FILENAME" },
      })

      -- Attach the user lsp mappings to every none-ls client.
      return { on_attach = utils_lsp.apply_user_lsp_mappings }
    end
  },
}
