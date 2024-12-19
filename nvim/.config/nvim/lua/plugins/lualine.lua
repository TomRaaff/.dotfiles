return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight", -- does this work?
			},
			sections = {
				lualine_a = { "filename" },
			},
		})
	end,
}
