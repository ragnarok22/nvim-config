require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Personal maps
map("n", "<leader>w", "<CMD> w <CR>")
map("n", "<leader>q", "<CMD> q <CR>")

-- move the selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- center Pagination
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- search and keep the search in the middle of the screen
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Fuzzy finds
map("n", "<leader><leader>", "<CMD> Telescope buffers <CR>", { desc = "Find Buffers" })

-- debugger
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)
