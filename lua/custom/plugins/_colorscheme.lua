return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function(_, opts)
    vim.cmd.colorscheme 'catppuccin-latte'
  end,
}
