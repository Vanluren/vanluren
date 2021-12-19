local autopairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

autopairs.setup()

local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
