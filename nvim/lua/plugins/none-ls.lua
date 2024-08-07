return {
	{
		"zeioth/none-ls-autoload.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"zeioth/none-ls-external-sources.nvim",
		},
		opts = {
			-- Here you can add support for sources not oficially suppored by none-ls.
			external_sources = {
				-- diagnostics
				"none-ls-external-sources.diagnostics.eslint",
				"none-ls-external-sources.diagnostics.eslint_d",
				"none-ls-external-sources.diagnostics.luacheck",
				"none-ls-external-sources.diagnostics.shellcheck",

				-- formatting
				"none-ls-external-sources.formatting.easy-coding-standard",
				"none-ls-external-sources.formatting.eslint",
				"none-ls-external-sources.formatting.eslint_d",
				"none-ls-external-sources.formatting.jq",
			},
		},
	},

	-- none-ls [lsp code formatting]
	-- https://github.com/nvimtools/none-ls.nvim
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local null_ls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			}
		end,
	},
}
