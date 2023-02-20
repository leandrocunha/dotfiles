local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Override line number colors to highlight the current
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#3a3b4e', bold=false })
vim.api.nvim_set_hl(0, 'LineNr', { bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#3a3b4e', bold=false })
