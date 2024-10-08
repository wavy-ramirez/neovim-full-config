local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>e", require("harpoon.cmd-ui").toggle_quick_menu)

vim.keymap.set("n", "<leader>fq", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>fw", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>fe", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>fr", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>fu", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>fi", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>fo", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>fp", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>ft", function() term.gotoTerminal(1) end)
