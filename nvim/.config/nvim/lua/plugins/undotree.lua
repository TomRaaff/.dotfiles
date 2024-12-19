return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "undotree: toggle" },
	},
	init = function()
		vim.g.undotree_SplitWidth = 46
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
