local telescope = require("telescope")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

local function lspReferenceResults(_, path, line)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  local relative_path = vim.fn.fnamemodify(parent, ":~:.")

  if parent == "." then
    return string.format("%s => line:%d", tail, line or 0)
  end

  return string.format("%s => .../%s => line:%d", tail, relative_path, line or 0)
end

telescope.setup({
  defaults = {
    layout_config = {
      height = 0.70,
      prompt_position = "top",
    },
    path_display = filenameFirst,
    prompt_prefix = "󰧚 ",
    sorting_strategy = "ascending",
    vim_gre,
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
    },
    lsp_references = {
      path_display = lspReferenceResults,
      show_line = false,
    },
    buffers = {
      show_all_buffers = true,
    },
    git_status = {
      git_icons = {
        added = " ",
        changed = " ",
        copied = " ",
        deleted = " ",
        renamed = "➡",
        unmerged = " ",
        untracked = " ",
      },
      previewer = false,
      theme = "dropdown",
    },
    show_line = false,
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
