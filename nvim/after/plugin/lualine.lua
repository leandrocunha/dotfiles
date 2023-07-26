require('lualine').setup({
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {{
      'filename',
      path = 1
    }},
    lualine_c = {
      'branch', 'diff', 'diagnostics'
    }
  }
})
