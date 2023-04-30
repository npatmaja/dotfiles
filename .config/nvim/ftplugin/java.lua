local jdtls = require('jdtls')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv('HOME')
local workspace_dir = home .. '/.local/share/eclipse/' .. project_name

local java_plugin_path = {
	['jdtls'] = home .. '/.local/share/nvim/mason/packages/jdtls',
	['lombok'] = home .. '/.local/share/nvim/mason/packages/jdtls',
	['java_debug'] = home .. '/.local/share/nvim/support/java-debug/com.microsoft.java.debug.plugin/target',
	['vscode_java_test'] = home .. '/.local/share/nvim/support/vscode-java-test/server',
	['java_8'] = home .. '/.sdkman/candidates/java/8.0.302-open',
	['java_17'] = home .. '/.sdkman/candidates/java/17-open',
	['java_19'] = home .. '/.sdkman/candidates/java/19-open',
}

local function getos()
	local u_os = io.popen('uname -s', "r"):read('*l')
	u_os = (u_os):lower()

	local os_map = {
		['linux'] = 'linux',
		['darwin'] = 'mac'
	}

	local os_name = os_map[u_os]
	if os_map[u_os] == nil then
		os_name = os_map.linux
	end
	return os_name
end

local bundles = {
	vim.fn.glob(java_plugin_path.java_debug .. "/com.microsoft.java.debug.plugin-*.jar")
}

vim.list_extend(bundles, vim.split(vim.fn.glob(java_plugin_path.vscode_java_test .. '/*.jar'), "\n"))

local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-javaagent:' .. java_plugin_path.lombok .. '/lombok.jar',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', java_plugin_path.jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
		'-configuration', java_plugin_path.jdtls .. '/config_' .. getos(),
		'-data', workspace_dir
	},
	root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
	settings = {
		java = {
			configuration = {
				runtimes = {
					name = "JavaSE-17",
					path = java_plugin_path.java_17
				},
				{
					name = "JavaSE-19",
					path = java_plugin_path.java_19
				},
				{
					name = "JavaSE-1.8",
					path = java_plugin_path.java_8
				}
			}
		}
	},
	init_options = {
		bundles = bundles
	},
	on_attach = function(client, bufnr)

		-- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
		-- you make during a debug session immediately.
		-- Remove the option if you do not want that.
		jdtls.setup_dap({ hotcodereplace = 'auto' })
		jdtls.setup.add_commands()

		local opts = { silent = true, buffer = bufnr }

		vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
		vim.keymap.set('n', "ø", jdtls.organize_imports, opts)
		vim.keymap.set('n', "<leader>ty", jdtls.test_class, opts)
		vim.keymap.set('n', "<leader>tr", jdtls.test_nearest_method, opts)
		vim.keymap.set('n', "crv", jdtls.extract_variable, opts)
		vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
		vim.keymap.set('n', "crc", jdtls.extract_constant, opts)

		-- from lsp, if any changes in `/after/plugin/lsp.lua` changes, the following keymap should be updated
		-- as well and vice versa
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

		local create_command = vim.api.nvim_buf_create_user_command

		create_command(bufnr, 'W', require('me.lsp.ext').remove_unused_imports, { nargs = 0 })
	end
}

require('jdtls').start_or_attach(config)

-- set tab size to 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
