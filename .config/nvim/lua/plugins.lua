-- Install vim-plug. 
-- the `vim.fn.stdpath 'data'` yields `.local/share/nvim` 
local install_path = vim.fn.stdpath 'data' .. '/site/autoload/plug.vim'
local remote_vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!curl -fLo ' .. install_path .. ' --create-dirs ' .. remote_vim_plug_url)
end


-- from https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug 'tpope/vim-fugitive' -- git wrapper
Plug 'tpope/vim-commentary' -- comment and uncomment line(s)
Plug 'tpope/vim-surround' -- surround texts
Plug 'windwp/nvim-autopairs' -- autopairs
Plug 'BurntSushi/ripgrep' -- line oriented search tool
Plug 'sharkdp/fd' -- It is a simple, fast and user-friendly alternative to find
Plug 'dyng/ctrlsf.vim' -- An ack/ag/pt/rg powered code search and view tool

-- vim UI extentions
Plug 'nvim-lualine/lualine.nvim' -- status line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim' -- Adds git-related info to the sign column, similar to gitgutter
Plug 'lukas-reineke/indent-blankline.nvim' -- adds indentation guides to all lines (including empty lines)
Plug 'romgrk/barbar.nvim' -- better tab management
Plug 'bluz71/vim-moonfly-colors' -- scheme

-- fuzzy finder
Plug 'nvim-lua/plenary.nvim' -- dependency of telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'dyng/ctrlsf.vim'
-- treesitter language parser for syntax highlitting and others
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- LSP and LSP aware autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets' -- Code snippets
Plug 'L3MON4D3/LuaSnip' -- Autocompletion
Plug ('glepnir/lspsaga.nvim', { branch= 'main' })

-- language related lsp
-- java
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap' -- debug adapter protocol
-- markdown
Plug 'ixru/nvim-markdown'


-- run PlugInstall and PlugUpdate automatically, should be placed after the `plug#begin`
-- as the plugin only be loaded after the call, error otherwise
-- vim.api.nvim_command('PlugUpdate')
-- vim.api.nvim_command('q')

vim.call('plug#end')

-- init
require('gitsigns').setup()
require('nvim-autopairs').setup{}
require("luasnip.loaders.from_vscode").lazy_load()
require('lualine').setup{ options = { theme = 'seoul256' } }
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
luasnip = require 'luasnip'
