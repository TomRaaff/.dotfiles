return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			background = {
				light = "latte",
				dark = "macchiato", -- frappe, macchiato, mocha
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.20, -- percentage of the shade to apply to the inactive window
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				harpoon = true,
				mason = true,
				neotree = true,
				dap = true,
				dap_ui = true,
				nvim_surround = true,
				telescope = {
					enabled = true,
				},
				which_key = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}

-- NOTE: tokyonight
--
-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	init = function()
-- 		-- Load the colorscheme here.
-- 		-- Like many other themes, this one has different styles, and you could load
-- 		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
-- 		vim.cmd.colorscheme("tokyonight-night")
--
-- 		-- You can configure highlights by doing something like:
-- 		vim.cmd.hi("Comment gui=none")
-- 	end,
-- }
