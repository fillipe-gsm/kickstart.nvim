vim.pack.add { 'https://github.com/keremimo/noctalia.nvim' }

require('noctalia').setup {
  palette_path = vim.fn.expand '~/.config/noctalia/colors.json',
  transparent = false,
}
vim.cmd.colorscheme 'noctalia'

-- Make cursor line slighty darker
vim.api.nvim_set_hl(0, 'CursorLine', {
  bg = '#dfcf9f',
})

-- Same with `colorcolumn` (the 80 characters)
vim.api.nvim_set_hl(0, 'ColorColumn', {
  bg = '#ebdbb2',
})
