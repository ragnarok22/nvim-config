return {
  'Exafunction/windsurf.nvim',
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('codeium').setup {
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
      },
    }
  end,
}
