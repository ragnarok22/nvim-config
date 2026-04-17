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

    local slot_keys = { 'a', 's', 'd', 'f' }
    for i, key in ipairs(slot_keys) do
      vim.keymap.set('n', '<leader>m' .. key, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon slot ' .. i })
    end

    vim.keymap.set('n', '[h', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon prev' })
    vim.keymap.set('n', ']h', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next' })
  end,
}
