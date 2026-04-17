return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    providers = {
      -- openai = {
      --   endpoint = 'https://api.openai.com/v1',
      --   model = 'gpt-4.1', -- your desired model (or use gpt-4o, etc.)
      --   extra_request_body = {
      --     timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      --     temperature = 0.75,
      --     max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --     --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      --   },
      -- },
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-sonnet-4-20250514',
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
    provider = 'copilot',
    file_selector = { provider = 'telescope' },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim', -- file_selector provider
    'stevearc/dressing.nvim',
    {
      'folke/snacks.nvim',
      priority = 1000,
      lazy = false,
    },
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
        latex = { enabled = false },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
