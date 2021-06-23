local lspconfig = require("lspconfig")
local ts_utils = require("nvim-lsp-ts-utils")
local u = require("utils")

local cmd = { "typescript-language-server", "--stdio", "--tsserver-path", "/usr/local/bin/tsserver" }

local ts_utils_settings = {
    -- debug = true,
    enable_import_on_completion = true,
    complete_parens = true,
    signature_help_in_parens = true,
    eslint_bin = "eslint",
    eslint_enable_diagnostics = true,
    enable_formatting = true,
    formatter = "prettier",
    update_imports_on_move = true,
}

local M = {}

M.setup = function(on_attach)
    lspconfig.tsserver.setup({
        cmd = cmd,
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client)

            ts_utils.setup(ts_utils_settings)
            ts_utils.setup_client(client)

            u.buf_map("n", "gs", ":TSLspOrganize<CR>", nil, bufnr)
            u.buf_map("n", "gI", ":TSLspRenameFile<CR>", nil, bufnr)
            u.buf_map("n", "gt", ":TSLspImportAll<CR>", nil, bufnr)
            u.buf_map("n", "qq", ":TSLspFixCurrent<CR>", nil, bufnr)
            vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
        end,
    })
end

return M
