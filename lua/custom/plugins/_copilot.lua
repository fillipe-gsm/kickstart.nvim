-- Lua version of Copilot plugin
-- After first installation, run :Copilog auth
return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- I commented this in case I do not use `copilot-cmp`
      -- suggestion = {
      --   enabled = true,
      --   auto_trigger = false,
      --   hide_during_completion = true,
      --   debounce = 75,
      --   trigger_on_accept = true,
      --   keymap = {
      --     accept = '<C-x>',
      --     accept_word = false,
      --     accept_line = false,
      --     next = '<C-n>',
      --     prev = '<C-p>',
      --     dismiss = '<C-]>',
      --   },
      -- },
    }
  end,
}
