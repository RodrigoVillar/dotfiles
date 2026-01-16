local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", "", { desc = "Telescope" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope show recent files" })

vim.keymap.set("n", "<leader>p", "", { desc = "Peek" })
vim.keymap.set("n", "<leader>pd", builtin.lsp_definitions, { desc = "Peek definitions" })
vim.keymap.set("n", "<leader>pt", builtin.lsp_type_definitions, { desc = "Peek type definitions" })
vim.keymap.set("n", "<leader>pr", builtin.lsp_references, { desc = "Peek references" })

vim.keymap.set("n", "<leader>n", "", { desc = "NvimTree" })
vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>g", "", { desc = "Git" })
vim.keymap.set("n", "<leader>gt", ":Neogit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

-- Directional window switching (more precise)
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window Movement" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Disable search highlights" })
