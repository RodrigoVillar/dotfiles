return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			pickers = {
				find_files = {
					-- Show hidden files (dotfiles)
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--glob", "!**/.git/*" }
					end,
				},
			},
		},
	},
}
