return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"gofumpt",
				"goimports",
				"golines",
				"prettier",
				"stylua",

				-- Linters
				"golangci-lint",
				"rustfmt",
				"ruff",

				-- Other tools
				"rust-analyzer",
				"gopls",
				"ty",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000, -- ms
		})
	end,
}
