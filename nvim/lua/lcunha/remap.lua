vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-q>", vim.cmd.bprevious)
vim.keymap.set("n", "<C-w>", vim.cmd.bnext)

-- vs-tasks
vim.keymap.set("n", "<leader>ta", ":lua require'telescope'.extensions.vstask.tasks()<CR>")
vim.keymap.set("n", "<leader>ti", ":lua require'telescope'.extensions.vstask.inputs()<CR>")
vim.keymap.set("n", "<leader>th", ":lua require'telescope'.extensions.vstask.history()<CR>")
vim.keymap.set("n", "<leader>tl", ":lua require'telescope'.extensions.vstask.launch()<CR>")

-- lazygit
vim.keymap.set("n", "<leader>g", ":FloatermNew lazygit<CR>")
