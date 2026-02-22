local jdtls = require('jdtls')

local mason_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local launcher   = vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
local config_dir = mason_path .. '/config_linux'

-- Determine java home: prefer JAVA_HOME env, fall back to known path
local java_home = os.getenv('JAVA_HOME') or '/usr/lib/jvm/java-21-openjdk-amd64'
local java_bin  = vim.fn.exepath('java') ~= '' and vim.fn.exepath('java') or (java_home .. '/bin/java')

-- Unique workspace per project (jdtls requirement)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls/workspaces/' .. project_name

local config = {
  cmd = {
    java_bin,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', launcher,
    '-configuration', config_dir,
    '-data', workspace_dir,
  },

  root_dir = jdtls.setup.find_root({ '.git', 'gradlew', 'mvnw', 'build.gradle', 'pom.xml' }),

  settings = {
    java = {
      configuration = {
        runtimes = {
          { name = 'JavaSE-21', path = java_home },
        },
      },
      format = {
        enabled = true,
      },
    },
  },

  init_options = {
    bundles = {},
  },

  on_attach = function(client, bufnr)
    -- Generic LSP keymaps (gd, K, gr, etc.) are handled globally by NvChad.
    -- Only Java-specific keymaps are defined here.
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format,     opts)
    vim.keymap.set('n', '<leader>oi', jdtls.organize_imports, opts)
    vim.keymap.set('n', '<leader>ev', jdtls.extract_variable, opts)
    vim.keymap.set('n', '<leader>em', jdtls.extract_method,   opts)
  end,
}

jdtls.start_or_attach(config)
