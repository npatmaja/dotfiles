local nvim_lsp = require('lspconfig')

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
	pylsp = {},
	tsserver = {},
	gopls = {},
	tailwindcss = {
		filetypes = { "gohtml", "haml", "handlebars", "hbs", "html", "jade", "leaf", "mustache", "css", "less",
			"postcss", "sass", "scss", "javascript", "javascriptreact", "rescript", "typescript", "typescriptreact",
			"vue", "svelte", "templ" },
		init_options = { userLanguages = { templ = "html" } }
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
	marksman = {},
	html = {
		filetypes = { "html", "templ" }
	},
	sqlls = {},
	templ = {},
}

for lsp, opts in pairs(servers) do
	opts['capabilities'] = capabilities
	nvim_lsp[lsp].setup(opts)
end


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
		vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
	end,
})

-- LSPSaga key mappings

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename ++project<CR>', opts)
vim.keymap.set({ "n", "v" }, '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
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

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Set completeopt to have a better completion experience.
vim.opt.completeopt = 'menuone,noselect,noinsert'
