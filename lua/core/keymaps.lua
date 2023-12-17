-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Open Vim explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")

-- move the selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center Pagination
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search and keep the search in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to the system
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "[Y]ank to system" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "[Y]ank line to system" })

-- Split movement
vim.keymap.set("n", "<C-Right>", "<C-W><C-L>", { desc = "Move to the right split" })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "Move to the right split" })
vim.keymap.set("n", "<C-Up>", "<C-W><C-K>", { desc = "Move to the top split" })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "Move to the top split" })
vim.keymap.set("n", "<C-Down>", "<C-W><C-J>", { desc = "Move to the bottom split" })
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "Move to the bottom split" })
vim.keymap.set("n", "<C-Left>", "<C-W><C-H>", { desc = "Move to the left split" })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "Move to the left split" })

-- Split resize
vim.keymap.set("n", "<leader>>", "10 <C-W>>", { desc = "Increase split size" })
vim.keymap.set("n", "<leader><", "10 <C-W><", { desc = "Decrease split size" })

-- Open Splited files
vim.keymap.set("n", "<leader>h", ":split<CR>", { desc = "Open horizontal split" })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Open vertical split" })

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
