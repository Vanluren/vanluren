local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local null_ls = require("null-ls")
local appearance = require("lsp/appearance")
local handlers = require("lsp/handlers")
local b = null_ls.builtins

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	appearance.setup()

	vim.cmd([[augroup Format]])
	vim.cmd([[autocmd! * <buffer>]])
	vim.cmd([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync({}, 2000)]])
	vim.cmd([[augroup END]])

	handlers.on_attach()
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,

		capabilities = capabilities,
	}

	if server.name == "tsserver" then
		opts.root_dir = lspconfig.util.root_pattern("tsconfig.json", ".git")
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			on_attach(client, bufnr)
		end
	end

	if server.name == "eslint" then
		opts.root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.json", ".git")

		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			on_attach(client, bufnr)
		end

		opts.settings = {
			format = { enable = true },
		}
	end

	server:setup(opts)
end)

null_ls.setup({
	sources = {
		b.formatting.prettierd.with({
			filetypes = {
				"html",
				"markdown",
				"css",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"json",
			},
		}),

		-- Lua
		b.formatting.stylua,
		b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

		-- Shell
		b.formatting.shfmt,
		b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

		-- Prisma
		b.formatting.prismaFmt,
	},
	on_attach = on_attach,
})
