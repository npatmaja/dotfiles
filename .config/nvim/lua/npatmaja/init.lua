require('npatmaja.packer')
require('npatmaja.keymap')

-- Set highlight on search. This will remove the highlight after searching for text.
vim.opt.hlsearch = false

-- Make relative line numbers default. The current line number will be shown as well
-- as relative numbering from that current line. It makes navigating around code easier.
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable break indent.
vim.opt.breakindent = true

-- Save undo history.
vim.opt.undofile = true

-- Case insensitive searching unless /C or capital in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time.
vim.opt.updatetime = 250
vim.wo.signcolumn = 'yes'

-- tab_size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Set colorscheme defaults (order is important here).
vim.opt.termguicolors = true
vim.g.onedark_terminal_italics = 2

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
	[[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	set mouse+=a
]],
	false
)

-- Set dark theme
vim.opt.background = 'dark'
vim.cmd [[colorscheme tokyonight-night]]

-- auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- mdx support
vim.filetype.add({
	extension = {
		mdx = 'mdx'
	}
})
