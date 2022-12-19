-- Remap comma as the leader key. Leader key is a special key that will allow us to
-- make some additional keybindings.
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use `vim.keymap.set` which provide better API instead of `vim.api.nvim_set_keymap` 
-- https://neovim.io/doc/user/lua.html#vim.keymap.set()
-- https://neovim.io/doc/user/map.html#%3Amap-arguments

-- Disable esc and replace it with `jk`
vim.keymap.set('i', '<Escape>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('i', 'jk', '<Escape>', { noremap = true, silent = true })

-- Copy to clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true })
