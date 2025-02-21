return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<C-b>', function()
      harpoon:list():add()
    end, { desc = 'Add file to Harpoon' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open Harpoon menu' })

    vim.keymap.set('n', '<C-a>', function()
      harpoon:list():select(1)
    end, { desc = 'Go to First Harpoon file' })
    vim.keymap.set('n', '<C-s>', function()
      harpoon:list():select(2)
    end, { desc = 'Go to Second Harpoon file' })
    vim.keymap.set('n', '<C-d>', function()
      harpoon:list():select(3)
    end, { desc = 'Go to Third Harpoon file' })
    vim.keymap.set('n', '<C-f>', function()
      harpoon:list():select(4)
    end, { desc = 'Go to Fourth Harpoon file' })

    vim.keymap.set('n', '<S-Tab>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<Tab>', function()
      harpoon:list():next()
    end)
  end,
}
