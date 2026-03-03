-- Run linter in the code
return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    -- Custom LanguageTool linter
    -- Requires `languagetool-commandline` installed and in the $HOME directory
    -- Follow https://github.com/languagetool-org/languagetool
    lint.linters.languagetool = {
      name = 'languagetool',
      cmd = 'java',
      stdin = false,
      args = {
        '-jar',
        vim.fn.expand '~/LanguageTool-6.6-stable/languagetool-commandline.jar',
        '-l',
        'en-US',
      },
      stream = 'stdout',
      ignore_exitcode = true,
      parser = function(output, bufnr)
        local diagnostics = {}
        -- Parse LanguageTool output line by line
        -- Format: "Line X, column Y, Rule ID: ... Message: ..."
        for line_text in output:gmatch '[^\r\n]+' do
          local line, col = line_text:match 'Line (%d+), column (%d+),'
          if line and col then
            -- Next line should have "Message: ..."
            local message = output:match('Line ' .. line .. ', column ' .. col .. '.-\nMessage: ([^\n]+)')
            if message then
              table.insert(diagnostics, {
                lnum = tonumber(line) - 1,
                col = tonumber(col) - 1,
                end_lnum = tonumber(line) - 1,
                end_col = tonumber(col),
                severity = vim.diagnostic.severity.WARN,
                message = message,
                source = 'LanguageTool',
              })
            end
          end
        end
        return diagnostics
      end,
    }

    -- Disable MD013 (line length) for markdownlint
    lint.linters.markdownlint.args = {
      '--disable',
      'MD013',
      '--',
    }

    lint.linters_by_ft = {
      python = { 'ruff' },
      sh = { 'shellcheck' },
      javascript = { 'eslint_d' },
      json = { 'jsonlint' },
      markdown = { 'markdownlint', 'languagetool' },
      tex = { 'chktex' },
      asciidoc = { 'languagetool' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require('lint').try_lint()
      end,
    })
  end,
}
