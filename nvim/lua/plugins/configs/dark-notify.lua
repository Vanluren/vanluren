local cmd = vim.cmd
local dn = require("dark_notify")
local opt = vim.opt

-- Default theme
opt.bg = "dark"
cmd("colorscheme onedark")

-- DarkNotify

function nox()
	cmd("colorscheme onedark")
	cmd("set bg=dark")
end

function lumos()
	cmd("colorscheme ayu-light")
	cmd("set bg=light")
end

dn.configure({
	schemes = {
		dark = "onedark",
		light = "ayu-light",
	},
})

cmd("command! Nox :lua nox()")
cmd("command! Lumos :lua lumos()")
cmd("command! ToggleDN :lua require('dark_notify').toggle()")
