require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>rp", require("utils.python_runner").run_python_script, { desc = "run Python script" })
map("n", "<leader>ju", require("justice").select, { desc = "justfile"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
