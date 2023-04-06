return require('packer').startup(function(use)
	use("wbthomason/packer.nvim")

	-- General vim plugins
	use('tpope/vim-commentary') -- comment and uncomment line(s)
	use('tpope/vim-surround') -- surrounds text
	use('windwp/nvim-autopairs')
	use('lewis6991/gitsigns.nvim') -- Adds git related info, similar to gitgutter
	use('lukas-reineke/indent-blankline.nvim') -- adds indentation guides to all lines (including empy lines)
	use('romgrk/barbar.nvim') -- better tab management
	use('nvim-lualine/lualine.nvim') -- status line

	-- color scheme
	use('folke/tokyonight.nvim')

	-- telescope fuzzy finder
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})
	use('nvim-telescope/telescope-file-browser.nvim')

	-- tree sitter
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})

	-- LSP and LSP-aware autocompletions
	use('neovim/nvim-lspconfig')
	use('hrsh7th/nvim-cmp') -- nvim autocompletions
	use('hrsh7th/cmp-buffer') -- completion source from buffer
	use('hrsh7th/cmp-nvim-lsp') -- completion source from lsp
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }) -- snippets engine
	use('rafamadriz/friendly-snippets') -- snippets
	use('saadparwaiz1/cmp_luasnip') -- cmp completion source for luasnip
	use({
		'glepnir/lspsaga.nvim',
		branch = 'main',
		opt = true,
		event = 'LspAttach',
		config = function()
			require('lspsaga').setup({
				request_timeout = 60000,
			})
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
		}
	})
	use('onsails/lspkind.nvim') -- vscode like lsp pictograms

	-- Java LSP
	use('mfussenegger/nvim-jdtls') -- Java lsp (jdtls)
	use('mfussenegger/nvim-dap') -- java debugger

	-- Markdown
	use('ixru/nvim-markdown')
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

end)
