return {
  "folke/neodev.nvim",  -- Keymaps hints
  "github/copilot.vim",

  "tpope/vim-surround",

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",  -- GitHub related

  "mfussenegger/nvim-dap",  -- Debug Adapter Protocol

  {
    "ragnarok22/whereami.nvim",
  },
  { "mistricky/codesnap.nvim", build = "make" },
  -- integrate tmux with nvim
  { "christoomey/vim-tmux-navigator", event = "BufReadPre" },
}
