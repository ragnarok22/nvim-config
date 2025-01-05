return {
  'ragnarok22/whereami.nvim',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },

  {

    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  keys = {
    { '<leader>lg', '<CMD>LazyGit<CR>', desc = 'Open LazyGit' },
  },

  {
    'christoomey/vim-tmux-navigator',
    event = 'VimEnter',
    keys = {
      { '<C-h>', '<CMD>TmuxNavigateLeft<CR>', desc = 'Tmux left' },
      { '<C-j>', '<CMD>TmuxNavigateDown<CR>', desc = 'Tmux down' },
      { '<C-k>', '<CMD>TmuxNavigateUp<CR>', desc = 'Tmux up' },
      { '<C-l>', '<CMD>TmuxNavigateRight<CR>', desc = 'Tmux right' },
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
