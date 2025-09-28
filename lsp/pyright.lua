local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local python_path = require("utils.python_path").python_path

vim.notify("Custom pyright loaded, using pythonPath:" .. python_path(), vim.log.levels.DEBUG)
return {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        pythonPath = python_path(),
      },
    },
  }
