-- Remap space as leader key. Leader key is a special key that will allow us to
-- make some additional keybindings. I'm using a comma, but you can use whatever
-- you'd wish. We'll use it (for example) for searching and changing files
-- (by pressing comma, then `s` and then `f`).
vim.api.nvim_set_keymap('', '<Comma>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Remap for dealing with word wrap. In general, the `nvim_set_keymap` is the
-- function we can use to create any keymap you'd wish. I tend to keep those
-- related to the whole editor here, while leaving the ones for specific plugins
-- to their own configuration files. That way if I ever remove or change plugins
-- I can keep my keybindings clean.
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

-- Disable esc and replace it with `jk`
vim.api.nvim_set_keymap('i', '<Escape>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Escape>', { noremap = true, silent = true })

-- Copy to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })
