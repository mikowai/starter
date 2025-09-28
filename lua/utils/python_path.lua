local M ={}

-- Returns the absolute Python executable path for LSP/DAP
function M.python_path()
  local cwd = vim.fn.getcwd()

  -- .venv
  local venv_bin = cwd .. "/.venv/bin/python"
  if vim.fn.filereadable(venv_bin) == 1 then
    return venv_bin
  end

  -- fallback: system python
  return vim.fn.exepath("python3") or "python3"
end
print("DEBUG: custom.utils.python_path loaded.")
return M
