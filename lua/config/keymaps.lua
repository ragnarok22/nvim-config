-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Open Vim explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>x', ':x<CR>')

-- move the selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- center Pagination
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- search and keep the search in the middle of the screen
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- yank to the system
vim.keymap.set('n', '<leader>y', '"+y', { desc = '' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to system' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank line to system' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Split resize
vim.keymap.set('n', '<leader>>', '10 <C-W>>', { desc = 'Increase split size' })
vim.keymap.set('n', '<leader><', '10 <C-W><', { desc = 'Decrease split size' })

-- Open Splited files
vim.keymap.set('n', '<leader>h', ':split<CR>', { desc = 'Open horizontal split' })
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Open vertical split' })

-- Git
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })

-- Open LazyGit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open LazyGit' })

vim.keymap.set('n', '<Esc>', '<CMD>noh<CR>', { desc = 'Clear search highlight' })

vim.keymap.set('n', '<leader>e', '<CMD> lua vim.diagnostic.open_float() <CR>', { desc = 'Show diagnostics' })
