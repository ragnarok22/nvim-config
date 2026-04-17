return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory (oil)' },
    { '<leader>o', '<cmd>Oil<cr>', desc = 'Open oil file editor' },
  },
  opts = {
    default_file_explorer = true,
    view_options = { show_hidden = true },
  },
}
