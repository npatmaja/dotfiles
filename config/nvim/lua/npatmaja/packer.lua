return require('packer').startup(function(use)
	use("wbthomason/packer.nvim")

	-- General vim plugins
	use('tpope/vim-commentary') -- comment and uncomment line(s)
	use('tpope/vim-surround') -- surrounds text
	use('tpope/vim-fugitive')
	use('windwp/nvim-autopairs')
	use('lewis6991/gitsigns.nvim')                               -- Adds git related info, similar to gitgutter
	use({ 'lukas-reineke/indent-blankline.nvim', tag = "v2.20.8" }) -- adds indentation guides to all lines (including empy lines)
	use({ 'akinsho/bufferline.nvim', tag = "*" })
	use('nvim-lualine/lualine.nvim')                             -- status line
	use("nvim-tree/nvim-web-devicons")

	-- color scheme
	use('folke/tokyonight.nvim')

	-- telescope fuzzy finder
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})
	use('nvim-telescope/telescope-file-browser.nvim')

	-- tree sitter
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})

	-- LSP and LSP-aware autocompletions
	use('neovim/nvim-lspconfig')
	use('hrsh7th/nvim-cmp')                -- nvim autocompletions
	use('hrsh7th/cmp-buffer')              -- completion source from buffer
	use('hrsh7th/cmp-nvim-lsp')            -- completion source from lsp
	use({ "L3MON4D3/LuaSnip", tag = "v2.*" }) -- snippets engine
	use('rafamadriz/friendly-snippets')    -- snippets
	use('saadparwaiz1/cmp_luasnip')        -- cmp completion source for luasnip
	use({
		'nvimdev/lspsaga.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('lspsaga').setup({
				request_timeout = 60000,
			})
		end,
	})
	use('onsails/lspkind.nvim') -- vscode like lsp pictograms
	use {
		"williamboman/mason.nvim"
	}

	-- Java LSP
	use('mfussenegger/nvim-jdtls') -- Java lsp (jdtls)
	use('mfussenegger/nvim-dap') -- java debugger
	use('leoluz/nvim-dap-go')   -- dap helper for golang
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use('theHamsta/nvim-dap-virtual-text')

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
end)
