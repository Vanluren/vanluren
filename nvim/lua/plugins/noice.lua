return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			signature = { enabled = false },
			hover = { enabled = false },
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = true,
		},
	},
}
