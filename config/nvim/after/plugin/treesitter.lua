require('nvim-treesitter.configs').setup({
	ensure_installed = 'all',
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- indentation based on the treesitter for the `=`. NOTE: EXPERIMENTAL
	indent = {
		enable = true
	}
})
-- mdx support
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.mdx = "markdown"
