-- Currently only works with https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz
local root_dir = "/Users/mattia.dalben/Downloads/jdt-0-57"
local pde_dir = "/Users/mattia.dalben/Downloads/vscode-pde/extension/server"
local kura_dir = "/Users/mattia.dalben/Desktop/EclipseKura/iot-kura-develop/git/kura"
local jar = vim.fn.expand( root_dir .. "/plugins" .. "/org.eclipse.equinox.launcher_*.jar" )
local lombok = vim.fn.expand( root_dir .. "/lombok.jar" )
local config = vim.fn.expand( root_dir .. "/config_mac")

local bundles = { vim.fn.glob(kura_dir .. "/kura/org.*/target/*.jar") }
vim.list_extend( bundles, vim.split(vim.fn.glob(pde_dir .. "/*.jar"), "\n"))

print(bundles)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = { "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xms1g",
            "-Xmx2G",
            "-jar",
            jar,
            "-configuration",
            config,
            "-data",
            "/tmp/jdtls_wrkdir"
    },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

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
    bundles = bundles
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
