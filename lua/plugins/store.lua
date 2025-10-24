return {
  'alex-popov-tech/store.nvim',
  branch = 'hotfix-notify-callback',
  dependencies = {
    'OXY2DEV/markview.nvim', -- optional, for pretty readme preview / help window
  },
  cmd = 'Store',
  keys = {
    { '<leader>s', '<cmd>Store<cr>', desc = 'Open Plugin Store' },
  },
  opts = {
    -- optional configuration here
  },
}
