-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
do
  -- Highlight when yanking (copying) text
  --  Try it with `yap` in normal mode
  --  See `:help vim.hl.on_yank()`
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.hl.on_yank()
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    desc = 'Python: 4 spaces for tabs',
    group = vim.api.nvim_create_augroup('custom-python-indent', { clear = true }),
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.expandtab = true
    end,
  })
end
