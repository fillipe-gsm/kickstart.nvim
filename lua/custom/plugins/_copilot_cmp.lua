-- Integrate Copilot into the cmp menu
return {
  'zbirenbaum/copilot-cmp',
  config = function()
    require('copilot_cmp').setup()
  end,
}
