local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename ++project<CR>', opts)
vim.keymap.set({"n","v"}, '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>", opts)
vim.keymap.set('n', '<leader>sl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>sb', '<Cmd>Lspsaga show_buf_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>sw', '<Cmd>Lspsaga show_workspace_diagnostics<CR>', opts)
vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set("n", "[e", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]e", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], { silent = true })
-- for osx
vim.keymap.set("n", "∂", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
vim.keymap.set("t", "∂", [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], { silent = true })

