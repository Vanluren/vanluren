return {
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("flow").setup({
				transparent = false, -- Set transparent background.
				fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
				mode = "normal", -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
				aggressive_spell = false, -- Display colors for spell check.
			})

			vim.cmd("colorscheme flow")
		end,
	},
	{
		"Shatur/neovim-ayu",
		priority = 1000,
	},
	{
		"Vanluren/neovim-onehalf",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd("colorscheme onehalf")
		end,
	},
}
