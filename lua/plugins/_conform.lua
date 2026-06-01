-- ============================================================
-- SECTION 6: FORMATTING
-- conform.nvim setup and keymap
-- ============================================================
do
  -- [[ Formatting ]]
  vim.pack.add { 'https://github.com/stevearc/conform.nvim' }
  require('conform').setup {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- You can specify filetypes to autoformat on save here:
      local enabled_filetypes = {
        -- lua = true,
        python = true,
      }
      if enabled_filetypes[vim.bo[bufnr].filetype] then
        return { timeout_ms = 500 }
      else
        return nil
      end
    end,
    default_format_opts = {
      lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
    },
    -- You can also specify external formatters in here.
    formatters_by_ft = {
      lua = { 'stylua' },
      python = {
        -- Fix auto-fixable linter errors
        -- "ruff_fix",
        -- Run the formatter
        'ruff_format',
        -- Organize the imports
        'ruff_organize_imports',
      },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { 'rustfmt', lsp_format = 'fallback' }, -- needs to be installed separately
      -- Conform will run the first available formatter
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'superhtml' },
      -- css = { 'stylelint' }, -- I need to learn how to use this as a formatter
      json = { 'jq' },
    },
  }

  vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
    require('conform').format { async = true }
  end, { desc = '[F]ormat buffer' })
end
