-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.g.mapleader = " "

-- Autocmd to stop garbage text from populating window when switching windows
vim.api.nvim_create_autocmd({ "FocusLost", "FocusGained" }, {
	callback = function()
		vim.cmd("stopinsert")
	end,
})

vim.opt.colorcolumn = "80,100"
vim.opt.scrolloff = 999

-- Show marks in the sign column
vim.opt.signcolumn = "yes" -- Always show sign column

-- Enable mark signs (this might work in some Neovim versions)
vim.g.show_marks = 1
