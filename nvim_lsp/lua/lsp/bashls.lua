local M = {}

M.setup = function(on_attach)
    require("lspconfig").bashls.setup({ on_attach = on_attach })
end

return M
