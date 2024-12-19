return {
	"miversen33/sunglasses.nvim",
	config = function()
		-- subdues all panes that do not have focus
		require("sunglasses").setup({
			filter_type = "SHADE",
			filter_percent = 0.20,
		})
	end,
}
