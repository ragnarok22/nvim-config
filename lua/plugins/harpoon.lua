return {
  'theprimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<C-b>', mark.add_file)
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

    vim.keymap.set('n', '<leader>d', function()
      ui.nav_file(1)
    end, { desc = 'Go to First Harpoon file' })
    vim.keymap.set('n', '<leader>s', function()
      ui.nav_file(2)
    end, { desc = 'Go to Second Harpoon file' })
    vim.keymap.set('n', '<leader>a', function()
      ui.nav_file(3)
    end, { desc = 'Go to Third Harpoon file' })
  end,
}
