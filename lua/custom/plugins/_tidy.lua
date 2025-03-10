-- Remove whitespace on save
return {
  'mcauley-penney/tidy.nvim',
  config = true,
  opts = {
    -- Ensure the tidyng works even when an .editorconfig is in the project
    provide_undefined_editorconfig_behavior = true,
  },
}
