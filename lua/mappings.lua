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

map("n", "<leader>a", function() harpoon:list():add() end, { desc = "add to harpoon list" })
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "open harpoon menu" })

map("n", "<C-u>", function() harpoon:list():select(1) end, { desc = "select from harpoon list (1)" })
map("n", "<C-i>", function() harpoon:list():select(2) end, { desc = "select from harpoon list (2)" })
map("n", "<C-o>", function() harpoon:list():select(3) end, { desc = "select from harpoon list (3)" })
map("n", "<C-p>", function() harpoon:list():select(4) end, { desc = "select from harpoon list (4)" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "previous harpoon item" })
map("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "next harpoon item" })
