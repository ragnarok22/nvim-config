local theme = {
  header = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Header',
    margin = 5,
    content = {
      '▗▄▄▖  ▗▄▖  ▗▄▄▖▗▖  ▗▖ ▗▄▖ ▗▄▄▖  ▗▄▖ ▗▖ ▗▖',
      '▐▌ ▐▌▐▌ ▐▌▐▌   ▐▛▚▖▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌▗▞▘',
      '▐▛▀▚▖▐▛▀▜▌▐▌▝▜▌▐▌ ▝▜▌▐▛▀▜▌▐▛▀▚▖▐▌ ▐▌▐▛▚▖ ',
      '▐▌ ▐▌▐▌ ▐▌▝▚▄▞▘▐▌  ▐▌▐▌ ▐▌▐▌ ▐▌▝▚▄▞▘▐▌ ▐▌',
      '  Coding for money, programming for fun  ',
      '                                         ',
    },
    highlight = 'Statement',
    default_color = '',
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = 'mapping',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Basic Commands',
    margin = 5,
    content = {
      { ' Find File', 'Telescope find_files', '<leader>ff' },
      { '󰍉 Find Word', 'Telescope live_grep', '<leader>lg' },
      { ' Recent Files', 'Telescope oldfiles', '<leader>of' },
      { ' File Browser', 'Telescope file_browser', '<leader>fb' },
      { ' Colorschemes', 'Telescope colorscheme', '<leader>cs' },
      { ' New File', "lua require'startup'.new_file()", '<leader>nf' },
    },
    highlight = 'String',
    default_color = '',
    oldfiles_amount = 0,
  },
  footer = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Footer',
    margin = 5,
    content = function()
      local plugin_name = 'startup.nvim'

      local version = vim.version()
      local version_string = 'nvim ' .. version.major .. '.' .. version.minor .. '.' .. version.patch
      return { version_string, plugin_name }
    end,
    highlight = 'Number',
    default_color = '',
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },
  mappings = {
    execute_command = '<CR>',
    open_file = 'o',
    open_file_split = '<c-o>',
    open_section = '<TAB>',
    open_help = '?',
  },
  colors = {
    background = '#1f2227',
    folded_section = '#56b6c2',
  },
  parts = { 'header', 'body', 'footer' },
}

return {
  'startup-nvim/startup.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    require('startup').setup(theme)
  end,
}
