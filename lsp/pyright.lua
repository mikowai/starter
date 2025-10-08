local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local python_utils = require("utils.python_path")

python_utils.setup_dynamic_python()

return {
    on_attach = on_attach,
    capabilities = capabilities,
    before_init = function(_, config)
      config.settings.python.pythonPath = python_utils.python_path()
    end,
    settings = {
      python = {
        pythonPath = python_utils.python_path(),
      },
    },
}
