return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = { "branch", "diagnostics" },
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = { "mode" },
			},
		})
	end,
}
