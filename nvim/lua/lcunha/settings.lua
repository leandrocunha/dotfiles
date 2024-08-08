local o = vim.o
local opt = vim.opt

-- globals
o.cursorline = true
o.swapfile = false
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.spell = true
opt.spelllang = "en_gb,pt_br"
opt.guicursor = {
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}
opt.splitright = true

-- Override line number colors to highlight the current
local dracula = "#3a3b4e"

-- catppuccin macchiato
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#939ab7", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#ed8796", fg = "#ed8796", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#939ab7", bold = false })

-- Terraformls minimal configuration
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
