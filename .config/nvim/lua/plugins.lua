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

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'bluz71/vim-moonfly-colors'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets' -- Code snippets
Plug 'L3MON4D3/LuaSnip' -- Autocompletion
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim' -- Adds git-related info to the sign column, similar to gitgutter
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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
luasnip = require 'luasnip'
