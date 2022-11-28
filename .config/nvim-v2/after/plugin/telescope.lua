local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
	file_ignore_patterns = {
		".git/", ".cache", "%.o", "%.a", "%.out", "%.class"
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
		builtin.find_files({ no_ignore = false, hidden = true})
	end
	, opts)
vim.keymap.set('n', '<leader><space>',
	function()
		builtin.buffers()
	end
	, opts)
vim.keymap.set('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
vim.keymap.set('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
vim.keymap.set('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
vim.keymap.set('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
vim.keymap.set('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.keymap.set('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
vim.keymap.set('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
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
