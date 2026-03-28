vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ty")
vim.lsp.enable("rust_analyzer")

vim.diagnostic.config({
	virtual_lines = true,
	underline = true,
	severity_sort = true,
})
