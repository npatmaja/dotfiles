local jdtls = require('jdtls')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local function getos()
	local u_os = io.popen('uname -s', "r"):read('*l')
	local home_dir = os.getenv('HOME')
	local nvim_local_share_dir = ''
	local local_share_dir = ''

	if u_os == nil or u_os == '' then
		-- handle if the OS is windows
		u_os = 'windows'
		home_dir = os.getenv('USERPROFILE')
		nvim_local_share_dir = home_dir .. '/AppData/Local/nvim-data'
		local_share_dir = home_dir .. '/AppData/Local'
	else
		-- Linux/OSX
		nvim_local_share_dir = home_dir .. '/.local/share/nvim'
		local_share_dir = home_dir .. '/.local/share'
	end

	local mason_jdtls_dir = nvim_local_share_dir .. '/mason/packages/jdtls'
	local nvim_jdtls_support_dir = nvim_local_share_dir .. '/support'
	local sdkman_java_dir = home_dir .. '/.sdkman/candidates/java'
	local workspace_dir = local_share_dir .. '/eclipse/' .. project_name

	u_os = (u_os):lower()

	local plugin_paths = {
		jdtls = mason_jdtls_dir,
		lombok = mason_jdtls_dir,
		java_debug = nvim_jdtls_support_dir .. '/java-debug/com.microsoft.java.debug.plugin/target',
		vscode_java_test = nvim_jdtls_support_dir .. '/vscode-java-test/server'
	}
	local java_paths = {
		java_8 = sdkman_java_dir .. '/8.0.302-open',
		java_17 = sdkman_java_dir .. '/17-open',
		java_19 = sdkman_java_dir .. '/19-open'
	}

	local os_map = {
		['linux'] = {
			config_dir = 'config_linux',
			plugin_paths = plugin_paths,
			java_paths = java_paths,
			workspace_dir = workspace_dir
		},
		['darwin'] = {
			config_dir = 'config_mac',
			plugin_paths = plugin_paths,
			java_paths = java_paths,
			workspace_dir = workspace_dir
		},
		['windows'] = {
			config_dir = 'config_win',
			plugin_paths = plugin_paths,
			java_paths = java_paths,
			workspace_dir = workspace_dir
		}
	}

	local os_name = os_map[u_os]
	if os_map[u_os] == nil then
		os_name = os_map.linux
	end
	return os_name
end

local os_config = getos()

local bundles = {
	vim.fn.glob(os_config.plugin_paths.java_debug .. "/com.microsoft.java.debug.plugin-*.jar")
}

vim.list_extend(bundles, vim.split(vim.fn.glob(os_config.plugin_paths.vscode_java_test .. '/*.jar'), "\n"))

local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-javaagent:' .. os_config.plugin_paths.lombok .. '/lombok.jar',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', os_config.plugin_paths.jdtls .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
		'-configuration', os_config.plugin_paths.jdtls .. '/' .. os_config.config_dir,
		'-data', os_config.workspace_dir
	},
	root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
	settings = {
		java = {
			configuration = {
				runtimes = {
					name = "JavaSE-17",
					path = os_config.java_paths.java_17
				},
				{
					name = "JavaSE-19",
					path = os_config.java_paths.java_19
				},
				{
					name = "JavaSE-1.8",
					path = os_config.java_paths.java_8
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
