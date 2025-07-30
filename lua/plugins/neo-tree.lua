return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
  keys = {
    { '<C-i>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      window = {
        mappings = {
          ['<C-i>'] = 'close_window',
        },
      },
    },
    window = {
      mappings = {
        ['P'] = { 'toggle_preview', config = { use_float = false, use_snacks_image = true, use_image_nvim = true } },
      },
    },
  },
}
