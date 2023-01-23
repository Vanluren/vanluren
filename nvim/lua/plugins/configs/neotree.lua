local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

return {
	"nvim-neo-tree/neo-tree.nvim",
	init = function()
		map("n", "<Leader>n", "<CMD>NeoTreeShowToggle<CR>", opts)
		map("n", "<Leader>nf", "<CMD>NeoTreeFocusToggle<CR>", opts)
	end,
}
