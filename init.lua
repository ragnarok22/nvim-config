-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Save the last cursor position
local autocmd = vim.api.nvim_create_autocmd

-- This autocmd will restore cursor position on file open
autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line '\'"'
    if line > 1 and line <= vim.fn.line '$' and vim.bo.filetype ~= 'commit' and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1 then
      vim.cmd 'normal! g`"'
    end
  end,
})

require 'config.lazy'

require 'config.options'
require 'config.keymaps'
