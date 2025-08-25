return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			-- You can use 'stop_after_first' to run the first available formatter from the list
			javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
			typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		},
	},
}
