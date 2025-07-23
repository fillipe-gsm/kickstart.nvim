-- Format code
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'never',
    },

    formatters_by_ft = {
      lua = { 'stylua' },
      python = {
        -- Fix auto-fixable linter errors
        -- "ruff_fix",
        -- Run the formatter
        'ruff_format',
        -- Organize the imports
        -- 'ruff_organize_imports',
      },
      -- You can customize some of the format options for the filetype (:help conform.format)
      -- rust = { 'rustfmt', lsp_format = 'fallback' },
      -- Conform will run the first available formatter
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      sh = { 'shfmt' }
    },
  },
}
