require('dap-go').setup()
require("nvim-dap-virtual-text").setup()
require("dapui").setup()

-- keybindings
local function generate_opts(desc)
	return {
		noremap = true,
		silent = true,
		desc = desc,
	}
end
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, generate_opts('dap continue'))
vim.keymap.set('n', '<F6>', function() require('dap').terminate() end, generate_opts('dap continue'))
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, generate_opts('dap step_over'))
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, generate_opts('dap step_into'))
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, generate_opts('dap step_out'))
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, generate_opts('dap toggle breakpoint'))
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, generate_opts('dap set breakpoint with conditionl'))
vim.keymap.set('n', '<Leader>lp',
function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, generate_opts('dap log point message'))
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, generate_opts('dap open repl'))
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, generate_opts('dap run last'))
vim.keymap.set('n', '<Leader>dtg', function() require('dap-go').debug_test() end, generate_opts('dap golang debug test'))

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function ()
	dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function ()
	dapui.close()
end
dap.listeners.before.event_exitec['dapui_config'] = function ()
	dapui.close()
end
