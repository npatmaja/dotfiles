-- This configuration is to initiate all plugins related to
-- vim's visual experiences

require('bufferline').setup({}) -- buffer line with tabpage integeation
require('gitsigns').setup()

require('lualine').setup({
	options = {
		theme = 'seoul256',
	},
})

-- indent blankline
vim.opt.list = true
vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')

require('indent_blankline').setup({
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = ' ',
})
