require "nvchad.mappings"
-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>rp", require("utils.python_runner").run_python_script, { desc = "run Python script" })
map("n", "<leader>ju", require("justice").select, { desc = "justfile"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "add to harpoon list" })
map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "open harpoon menu" })

map("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "select from harpoon list (1)" })
map("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "select from harpoon list (2)" })
map("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "select from harpoon list (3)" })
map("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "select from harpoon list (4)" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "previous harpoon item" })
map("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "run Python script" })

-- Wider vartical terminal
map("n", "<leader>v",
  function() vim.cmd("vsplit | terminal"); vim.cmd("vertical resize 80") end,
  {desc = "Open vertical terminal with custom size" })
