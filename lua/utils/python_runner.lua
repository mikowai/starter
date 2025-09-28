
local M = {}

-- Helper: check if a file exists in cwd
local function file_exists(filename)
  return vim.fn.filereadable(vim.fn.getcwd() .. "/" .. filename) == 1
end

-- Returns the Python command to use for the current project
function M.python_cmd()
  local cwd = vim.fn.getcwd()

  -- 1️⃣ UV: detect by uv.lock
  if file_exists("uv.lock") and vim.fn.executable("uv") == 1 then
    return "uv run python"
  end

  -- 2️⃣ Poetry: detect by poetry.lock
  if file_exists("poetry.lock") and vim.fn.executable("poetry") == 1 then
    return "poetry run python"
  end

  -- 3️⃣ PDM: detect by pdm.lock
  if file_exists("pdm.lock") and vim.fn.executable("pdm") == 1 then
    return "pdm run python"
  end

  -- 4️⃣ .venv fallback
  local venv_bin = cwd .. "/.venv/bin/python"
  if vim.fn.filereadable(venv_bin) == 1 then
    return venv_bin
  end

  -- 5️⃣ Fallback system Python
  return "python3"
end

function M.run_python_script()

  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local py_cmd = M.python_cmd()

  if vim.fn.filereadable(file) == 0 then
    print("Buffer is not a file on disk")
    return
  end

  -- Open split terminal and run Python file
  vim.cmd("split | terminal " .. py_cmd .. " " .. file)
end

return M
