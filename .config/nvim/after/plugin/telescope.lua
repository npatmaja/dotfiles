local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

telescope.setup {
	pickers = {
		find_files = {
			hidden = true,
		}
	},
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden'
		},
		file_ignore_patterns = {
			".git/.*", ".cache", "%.o", "%.a", "%.out", "%.class", "node_modules/.*"
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
local opts = { noremap = true, silent = true }
opts['desc'] = '[S]earch [F]ile'
vim.keymap.set('n', '<leader>sf', builtin.find_files, opts)

opts['desc'] = '[S]earch by [G]rep'
vim.keymap.set('n', '<leader>sg', builtin.live_grep, opts)

opts['desc'] = '[S]earch [I]mplementation'
vim.keymap.set('n', '<leader>si', builtin.lsp_implementations, opts)

opts['desc'] = '[ ] Find existing buffers'
vim.keymap.set('n', '<leader><space>', builtin.buffers, opts)

opts['desc'] = '[?] Find recently opened files'
vim.keymap.set('n', '<leader>?', builtin.oldfiles, opts)

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
end, { desc = '[S]earch [F]ile with file browser' })
