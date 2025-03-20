vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<C-h>", vim.cmd.bprevious)
vim.keymap.set("n", "<C-l>", vim.cmd.bnext)
vim.keymap.set("n", "<C-q>", vim.cmd.bdelete)
vim.keymap.set("n", "<C-b>", vim.cmd.Ex)
vim.keymap.set("n", "<C-n>", vim.cmd.enew)

vim.keymap.set("n", "<leader>h", vim.cmd.noh)

-- vs-tasks
vim.keymap.set("n", "<leader>ta", ":lua require'telescope'.extensions.vstask.tasks()<CR>")
vim.keymap.set("n", "<leader>ti", ":lua require'telescope'.extensions.vstask.inputs()<CR>")
vim.keymap.set("n", "<leader>th", ":lua require'telescope'.extensions.vstask.history()<CR>")
vim.keymap.set("n", "<leader>tl", ":lua require'telescope'.extensions.vstask.launch()<CR>")

-- lazygit
vim.keymap.set("n", "<leader>g", ":FloatermNew lazygit<CR>")

-- toggleterm
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- panels
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
