vim.pack.add {
  'https://github.com/arborist-ts/arborist.nvim',
}
require('arborist').setup {
  ensure_installed = { 'vim', 'vimdoc', 'python', 'javascript', 'html', 'lua', 'kdl', 'json' },
}
