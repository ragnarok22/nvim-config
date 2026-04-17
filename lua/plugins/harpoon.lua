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

    vim.keymap.set('n', '<C-p>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open Harpoon menu' })

    for i = 1, 4 do
      vim.keymap.set('n', '<leader>' .. i, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon slot ' .. i })
    end

    vim.keymap.set('n', '<C-S-J>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-K>', function()
      harpoon:list():next()
    end)
  end,
}
