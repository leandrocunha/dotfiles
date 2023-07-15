local o = vim.o
local opt = vim.opt

-- globals
o.swapfile = false

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

-- Terraformls minimal configuration
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
