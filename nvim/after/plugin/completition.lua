local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local api = vim.api

-- --   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- -- find more here: https://www.nerdfonts.com/cheat-sheet
--
-- -- custom popup style (background/borders) to match the theme colors
api.nvim_set_hl(0, "DraculaBackground", { bg = "#282a36" })
api.nvim_set_hl(0, "DraculaCurrentLine", { fg = "#44475a" })
api.nvim_set_hl(0, "DraculaComment", { fg = "#6272a4" })

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lua", max_item_count = 12 },
    { name = "luasnip", max_item_count = 12 },
    {
      name = "nvim_lsp",
      max_item_count = 12,
      entry_filter = function(entry, context)
        local kind = entry:get_kind()
        local line = context.cursor_line
        local col = context.cursor.col
        local char_before_cursor = string.sub(line, col - 1, col - 1)

        if char_before_cursor == "." then
          if kind == 2 or kind == 5 then
            return true
          else
            return false
          end
        elseif string.match(line, "^%s*%w*$") then
          if kind == 2 or kind == 5 then
            return true
          else
            return false
          end
        end

        return true
      end,
    },
    { name = "buffer", max_item_count = 12 },
    { name = "path", max_item_count = 12 },
  }),
  window = {
    completion = {
      border = "single",
      winhighlight = "Normal:DraculaBackground,FloatBorder:DraculaCurrentLine",
      zindex = 1,
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      border = "single",
      winhighlight = "Normal:DraculaBackground,FloatBorder:DraculaComment",
      zindex = 1,
    },
  },
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["eslint"].setup({
  capabilities = capabilities,
})
