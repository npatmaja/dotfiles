-- Remap comma as the leader key. Leader key is a special key that will allow us to
-- make some additional keybindings.
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Use `vim.keymap.set` which provide better API instead of `vim.api.nvim_set_keymap` 
-- https://neovim.io/doc/user/lua.html#vim.keymap.set()
-- https://neovim.io/doc/user/map.html#%3Amap-arguments

-- Disable esc and replace it with `jk`
keymap('i', 'jk', '<Escape>', opts)

-- Copy to clipboard
keymap('n', '<leader>y', '"+y', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>p', '"+p', opts)
keymap('v', '<leader>p', '"+p', opts)

-- Write and close
keymap('n', '<leader>w', '<cmd>w<CR>', opts)
keymap('n', '<leader>q', '<cmd>q<CR>', opts)
keymap('n', '<leader>wq', '<cmd>wq<CR>', opts)
keymap('n', '<leader>wy', '<cmd>bufdo write<CR>', opts) -- write all changing buffers
