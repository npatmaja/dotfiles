local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

-- nvim-cmp supports additional completion capabilities.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable the following language servers. If you ever find yourself needing
-- another programming language support, you'll have to find its LSP,
-- add it to this list and make sure it is installed in your system!
-- Tailwindcss: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss
local servers = {
	clangd = {},
	rust_analyzer = {},
	pyright = {},
	tsserver = {},
	gopls = {},
	tailwindcss = {
		filetypes = { "gohtml", "haml", "handlebars", "hbs", "html", "jade", "leaf", "mustache", "css", "less", "postcss", "sass", "scss", "javascript", "javascriptreact", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
	},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostic = {
					globals = { 'vim' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	bashls = {},
}

for lsp, opts in pairs(servers) do
	opts['on_attach'] = on_attach
	opts['capabilities'] = capabilities
	nvim_lsp[lsp].setup(opts)
end

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Set completeopt to have a better completion experience.
vim.opt.completeopt = 'menuone,noselect,noinsert'
