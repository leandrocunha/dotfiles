-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Create a new highlight color group
vim.api.nvim_command("highlight CustomFloatBorder guifg=#A9D0E6")

-- Set the custom border characters
local border_chars = {
  { "┌", "CustomFloatBorder" },
  { "─", "CustomFloatBorder" },
  { "┐", "CustomFloatBorder" },
  { "│", "CustomFloatBorder" },
  { "┘", "CustomFloatBorder" },
  { "─", "CustomFloatBorder" },
  { "└", "CustomFloatBorder" },
  { "│", "CustomFloatBorder" },
}

-- Set the custom border color to the diagnostic popup window
vim.diagnostic.config({
  float = {
    border = border_chars,
  },
  focus = true,
})

-- Add the border on hover popup window
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border_chars }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border_chars }),
}

-- Diagnostic symbols in the sign column (gutter)''
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  -- disable built-in auto-formmat and give preference to use null-ls plugin
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  -- enable eslint fix on save
  -- vim.cmd('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion = require("cmp_nvim_lsp").default_capabilities().textDocument.completion

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})

require("lspconfig").eslint.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  handlers = handlers,
})

require("lspconfig").jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  handlers = handlers,
})

require("lspconfig").marksman.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})

require("lspconfig").prismals.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})

require("lspconfig").stylelint_lsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "css", "scss" },
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
    },
  },
})

require("lspconfig").tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})

require("lspconfig").terraformls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "terraform", "tf" },
})

require("lspconfig").tflint.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "terraform", "tf" },
})

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  handlers = handlers,
})

require("lspconfig").volar.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "vue" },
})
