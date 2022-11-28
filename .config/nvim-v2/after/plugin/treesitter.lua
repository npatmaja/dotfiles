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
