return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"thenbe/neotest-playwright",
		"rcasia/neotest-java",
	},
	keys = {
		-- Run keymaps
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "test: [T]est [R]un nearest",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "test: [T]est [R]un [L]atest",
		},
		{
			"<leader>tx",
			function()
				require("neotest").run.stop()
			end,
			desc = "test: [T]est [R]un stop",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "test: [T]est [F]ile",
		},
		{
			"<leader>tF",
			function()
				require("neotest").run.run(vim.loop.cwd())
			end,
			desc = "test: [T]est all [F]iles",
		},
		{
			"<leader>tx",
			function()
				require("neotest").run.stop()
			end,
			desc = "test: [T]est stop",
		},

		-- Watch keymaps
		{
			"<leader>tw",
			function()
				require("neotest").watch.toggle()
			end,
			desc = "test: [T]est [W]atch nearest",
		},
		{
			"<leader>twf",
			function()
				require("neotest").watch.toggle({ vim.fn.expand("%") })
			end,
			desc = "test: [T]est [W]atch file",
		},
		{
			"<leader>tW",
			function()
				require("neotest").watch.toggle({ suite = true })
			end,
			desc = "test: [T]est [W]atch all files",
		},
		{
			"<leader>twx",
			function()
				require("neotest").watch.stop()
			end,
			desc = "test: [T]est [W]atch stop",
		},

		-- Debug keymaps
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "test: [T]est [D]ebug Nearest",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
				local win = vim.fn.bufwinid("Neotest Summary")
				if win > -1 then
					vim.api.nvim_set_current_win(win) -- focus neotest
				end
			end,
			desc = "test: [T]est [S]ummary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open()
			end,
			desc = "test: [T]est [O]utput",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "test: [T]est [O]utput panel",
		},

		-- Navigation keymaps
		{
			"[t",
			function()
				require("neotest").jump.prev({ status = "failed" })
			end,
			desc = "test: [T]est [N]ext",
		},
		{
			"]t",
			function()
				require("neotest").jump.next({ status = "failed" })
			end,
			desc = "test: [T]est [P]revious",
		},

		-- Playwright keymaps
		{
			"<leader>tp",
			[[:NeotestPlaywrightProject<CR>]],
			noremap = true,
			desc = "test: Playwright [T]est [P]roject",
		},
		{
			"<leader>tm",
			[[:NeotestPlaywrightPreset<CR>]],
			noremap = true,
			desc = "test: Playwright [T]est [M]ode",
		},
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				-- require("neotest-dotnet"),
				require("neotest-java")({
					-- ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
					-- junit_jar = nil,
					-- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
				}),
				require("neotest-playwright").adapter({
					options = {
						persist_project_selection = true,
						get_playwright_config = function()
							local cwd = vim.loop.cwd()
							local configs = {
								{
									project = "~/Workspace/dbtl-local/dbtl-frontend",
									config = "~/Workspace/dbtl-local/dbtl-frontend/playwright.config.ts",
								},
								{
									project = "/open-source/playwright-ct-optimizer",
									config = "/ct-solid/playwright.config.ts",
								},
								{
									project = "/open-source/playwright",
									config = "/tests/components/ct-react-vite/playwright.config.ts",
								},
							}
							for _, map in ipairs(configs) do
								if string.sub(cwd, -#map.project) == map.project then
									return cwd .. map.config
								end
							end
							return ""
						end,
					},
				}),
			},
			output = { open_on_run = true },
			summary = { open = "botright vsplit | vertical resize 46" },
			floating = {
				border = "single",
			},
			icons = {
				running_animated = {
					"",
					"󰪞",
					"󰪟",
					"󰪠",
					"󰪡",
					"󰪢",
					"󰪣",
					"󰪤",
					"󰪥",
					"󰪤",
					"󰪣",
					"󰪢",
					"󰪡",
					"󰪠",
					"󰪟",
					"󰪞",
					"",
				},

				child_indent = "│",
				child_prefix = "├",
				collapsed = "─",
				expanded = "┐",
				final_child_indent = " ",
				final_child_prefix = "└",
				non_collapsible = "─",

				failed = "",
				passed = "",
				running = "",
				skipped = "󰅚",
				unknown = "",
				watching = "󰛐",
			},
			watch = {
				enabled = true,
				symbol_queries = {
					go = "        ;query\n        ;Captures imported types\n        (qualified_type name: (type_identifier) @symbol)\n        ;Captures package-local and built-in types\n        (type_identifier)@symbol\n        ;Captures imported function calls and variables/constants\n        (selector_expression field: (field_identifier) @symbol)\n        ;Captures package-local functions calls\n        (call_expression function: (identifier) @symbol)\n      ",
					javascript = '  ;query\n  ;Captures named imports\n  (import_specifier name: (identifier) @symbol)\n  ;Captures default import\n  (import_clause (identifier) @symbol)\n  ;Capture require statements\n  (variable_declarator \n  name: (identifier) @symbol\n  value: (call_expression (identifier) @function  (#eq? @function "require")))\n  ;Capture namespace imports\n  (namespace_import (identifier) @symbol)\n',
					lua = '        ;query\n        ;Captures module names in require calls\n        (function_call\n          name: ((identifier) @function (#eq? @function "require"))\n          arguments: (arguments (string) @symbol))\n      ',
					python = "        ;query\n        ;Captures imports and modules they're imported from\n        (import_from_statement (_ (identifier) @symbol))\n        (import_statement (_ (identifier) @symbol))\n      ",
					java = "        ;query\n        ;captures imported classes\n        (import_declaration\n            (scoped_identifier name: ((identifier) @symbol))\n        )\n      ",
					rust = "        ;query\n        ;submodule import\n        (mod_item\n          name: (identifier) @symbol)\n        ;single import\n        (use_declaration\n          argument: (scoped_identifier\n            name: (identifier) @symbol))\n        ;import list\n        (use_declaration\n          argument: (scoped_use_list\n            list: (use_list\n                [(scoped_identifier\n                   path: (identifier)\n                   name: (identifier) @symbol)\n                 ((identifier) @symbol)])))\n        ;wildcard import\n        (use_declaration\n          argument: (scoped_use_list\n            path: (identifier)\n            [(use_list\n              [(scoped_identifier\n                path: (identifier)\n                name: (identifier) @symbol)\n                ((identifier) @symbol)\n              ])]))\n      ",
					tsx = '  ;query\n  ;Captures named imports\n  (import_specifier name: (identifier) @symbol)\n  ;Captures default import\n  (import_clause (identifier) @symbol)\n  ;Capture require statements\n  (variable_declarator \n  name: (identifier) @symbol\n  value: (call_expression (identifier) @function  (#eq? @function "require")))\n  ;Capture namespace imports\n  (namespace_import (identifier) @symbol)\n',
					typescript = '  ;query\n  ;Captures named imports\n  (import_specifier name: (identifier) @symbol)\n  ;Captures default import\n  (import_clause (identifier) @symbol)\n  ;Capture require statements\n  (variable_declarator \n  name: (identifier) @symbol\n  value: (call_expression (identifier) @function  (#eq? @function "require")))\n  ;Capture namespace imports\n  (namespace_import (identifier) @symbol)\n',
				},
			},
		})
	end,
}
