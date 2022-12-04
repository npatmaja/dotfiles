local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

telescope.setup {
	prickers = {
		live_grep = {
			additional_args = function(opts)
				return { '--hidden' }
			end
		},
	},
	defaults = {
		file_ignore_patterns = {
			".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "node_modules"
		},
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
			n = {
				['q'] = actions.close
			}
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				['i'] = {
					['<C-w>'] = function() vim.cmd('normal vbd') end,
				},
				['n'] = {
					-- your custom normal mode mappings
					['N'] = fb_actions.create,
					['h'] = fb_actions.goto_parent_dir,
					['/'] = function()
						vim.cmd('startinsert')
					end
				},
			}
		}
	}
}
telescope.load_extension('file_browser')

-- Add leader shortcuts.
-- TODO: convert to function call instead of calling cmd
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>sf',
	function()
		builtin.find_files({ no_ignore = false, hidden = true })
	end
	, opts)
vim.keymap.set('n', '<leader><space>',
	function()
		builtin.buffers()
	end
	, opts)
vim.keymap.set('n', '<leader>sg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.keymap.set('n', 'sf', function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 }
	})
end)
