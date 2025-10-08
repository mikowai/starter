local M = {}

-- Returns the absolute Python executable path
function M.python_path()
  local current_file = vim.api.nvim_buf_get_name(0)
  local file_dir = vim.fn.fnamemodify(current_file, ":p:h")

  -- Start from current file's directory and walk up
  local dir = file_dir
  while dir and dir ~= "/" do
    local venv_bin = dir .. "/.venv/bin/python"
    if vim.fn.filereadable(venv_bin) == 1 then
      return venv_bin
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end

  -- fallback: system python
  return vim.fn.exepath("python3") or "python3"
end


local current_python_path = nil

function M.setup_dynamic_python()
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.py",
    callback = function()
      local new_path = M.python_path()
      if current_python_path ~= new_path then
        current_python_path = new_path
        vim.cmd("LspRestart pyright")
      end
    end,
  })
end
return M
