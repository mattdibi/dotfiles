-- A lot of good stuff in: https://gitlab.com/schrieveslaach/dotfiles
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local project_hash = string.sub(vim.api.nvim_call_function("sha256", {vim.fn.getcwd()}), 1, 6)
local data_path = vim.env.HOME .. '/.cache/jdtls/' .. project_name .. '-' .. project_hash


-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob("/home/mattia/.vscode/extensions/vscjava.vscode-java-debug-0.50.0/server/com.microsoft.java.debug.plugin-*.jar", 1),
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/mattia/.vscode/extensions/vscjava.vscode-java-test-0.38.2/server/*.jar", 1), "\n"))
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/mattia/Downloads/vscode-pde-0.8.0/server/*.jar"), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/home/mattia/.vscode/extensions/redhat.java-1.18.0-linux-x64/server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', '/home/mattia/.vscode/extensions/redhat.java-1.18.0-linux-x64/server/config_linux',

    '-data', data_path,
  },

  root_dir = require('jdtls.setup').find_root({'javaConfig.json'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = { -- Required for fidget.nvim support see: https://github.com/j-hui/fidget.nvim/issues/57#issuecomment-1231730001
        progressReportProvider = false,
    },
  },
}

config['on_attach'] = function(client, bufnr)
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  -- You can use the `JdtHotcodeReplace` command to trigger it manually
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
