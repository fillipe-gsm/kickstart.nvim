vim.pack.add { 'https://github.com/mcauley-penney/tidy.nvim' }
require('tidy').setup {
  -- Ensure it keeps working even when an .editorconfig is in the project
  provide_undefined_editorconfig_behavior = true,
}
