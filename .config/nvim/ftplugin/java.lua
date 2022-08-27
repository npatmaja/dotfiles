local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home = os.getenv('HOME')
local workspace_dir = home .. '/.local/share/eclipse/' .. project_name

local java_plugin_path = {
    ['jdtls'] = home .. '/.local/share/java/jdtls',
    ['lombok'] = home .. '/.local/share/java/lombok',
    ['java_debug'] = home .. '/.local/share/java/java-debug/com.microsoft.java.debug.plugin/target',
    ['vscode_java_test'] = home .. '/.local/share/java/vscode-java-test/test',
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
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {}
    },
    init_options = {
        bundles = bundles
    },
    on_attach = function (client, bufnr)
        
        -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
        -- you make during a debug session immediately.
        -- Remove the option if you do not want that.
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
        require('jdtls.setup').add_commands()
    end
}

require('jdtls').start_or_attach(config)
