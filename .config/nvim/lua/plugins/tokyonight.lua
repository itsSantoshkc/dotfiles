return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		name = "tokyo-storm",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
}
