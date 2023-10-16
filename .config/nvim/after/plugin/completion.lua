local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-j>'] = cmp.mapping.select_prev_item(),
		['<C-k>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		-- If you don't set up snippets in the section below, this might crash, either go through the "Snippets" section or remove any `luasnip` related code from this config.
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	},
	formatting = {
		format = function(entry, vim_item)
			local kiroku_home = os.getenv("HOME") .. "/kiroku-copy"
			local cwd = vim.fn.getcwd()
			local is_markdown = entry.context.filetype == "markdown"

			if kiroku_home == cwd and is_markdown then
				-- get the front matter
				local file = io.open(entry.completion_item.detail, "r")
				if file == nil then
					return vim_item
				end
				local title = ""
				if file then
					local frontmatter = true
					local frontmatter_line_count = 0
					while frontmatter do
						local line = file:read("*l")
						if line == nil then
							break
						end
						if line == "---" then
							frontmatter_line_count = frontmatter_line_count + 1
						end
						if frontmatter_line_count >= 2 then
							frontmatter = false
						end
						if string.sub(line, 1, 6) == "title:" then
							title = "(" .. string.sub(line, 8, string.len(line)) .. ")"
						end
					end
				end
				file:close()

				local menu = ""
				if vim_item.menu ~= nil then
					menu = vim_item.menu
				end
				vim_item.menu = menu .. title
			end
			return vim_item
		end
	}
}

-- Snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- lspkind: add symbol to autocompletion
require('lspkind').init({
	mode = 'symbol_map',
	-- use default symbol
	-- symbol_map = {
	-- 	Text = "",
	-- 	Method = "",
	-- 	Function = "",
	-- 	Constructor = "",
	-- 	Field = "ﰠ",
	-- 	Variable = "",
	-- 	Class = "ﴯ",
	-- 	Interface = "",
	-- 	Module = "",
	-- 	Property = "ﰠ",
	-- 	Unit = "塞",
	-- 	Value = "",
	-- 	Enum = "",
	-- 	Keyword = "",
	-- 	Snippet = "",
	-- 	Color = "",
	-- 	File = "",
	-- 	Reference = "",
	-- 	Folder = "",
	-- 	EnumMember = "",
	-- 	Constant = "",
	-- 	Struct = "פּ",
	-- 	Event = "",
	-- 	Operator = "",
	-- 	TypeParameter = ""
	-- },
})
