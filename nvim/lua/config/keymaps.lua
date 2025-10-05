-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste into selection and keep copied value in the register" })
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Mass replace word under cursor" }
)
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quickfix list
vim.keymap.set("n", "<leader>co", "<Cmd>copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>ch", "<Cmd>cclose<CR>", { desc = "Hide quickfix list" })

-- Oil
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Yazi
vim.keymap.set("n", "<leader>yy", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
vim.keymap.set("n", "<leader>yz", "<cmd>Yazi cwd<cr>", { desc = "Open the file manager in nvim's working directory" })

-- Text Coverage
vim.keymap.set("n", "<leader>tcl", "<Cmd>Coverage<CR>", { desc = "[T]est [C]overage [L]oad" })
vim.keymap.set("n", "<leader>tct", "<Cmd>CoverageToggle<CR>", { desc = "[T]est [C]overage [T]oggle" })
vim.keymap.set("n", "<leader>tcd", "<Cmd>CoverageClear<CR>", { desc = "[T]est [C]overage [D]elete" })
vim.keymap.set("n", "<leader>tcs", "<Cmd>CoverageSummary<CR>", { desc = "[T]est [C]overage [S]ummary" })

-- Debug
vim.keymap.set("n", "<M-o>", function()
  require("dap").step_over()
end, { desc = "Debug: Step Over" })

-- Git
vim.keymap.set("n", "<leader>gy", function()
  require("gitlinker").get_buf_range_url("n", {})
end, { desc = "Copy file link" })

vim.keymap.set("n", "<leader>go", function()
  require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").open_in_browser })
end, { desc = "Open file link in browser", silent = true })

vim.keymap.set("v", "<leader>go", function()
  require("gitlinker").get_buf_range_url("v", { action_callback = require("gitlinker.actions").open_in_browser })
end, { desc = "Open file link in browser", silent = true })

-- TreeSJ
vim.keymap.set("n", "<leader>j", "<Cmd>TSJToggle<CR>", { desc = "Toggle block split" })

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undo tree" })

-- Origami
vim.keymap.set("n", "h", function()
  require("origami").h()
end)
vim.keymap.set("n", "$", function()
  require("origami").dollar()
end)

-- Harpoon
vim.keymap.set("n", "<leader>H", function()
  require("harpoon"):list():add()
end, { desc = "Add buffer to harpoon" })

vim.keymap.set("n", "<C-l>", function()
  require("harpoon"):list():next()
end, { desc = "Next harpoon buffer" })

vim.keymap.set("n", "<C-h>", function()
  require("harpoon"):list():prev()
end, { desc = "Previous harpoon buffer" })

vim.keymap.set("n", "<leader>h", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon quick menu" })

-- vim.keymap.set('n', '<leader>x', function()
--   require('harpoon.mark').rm_file()
-- end, { desc = 'Remove buffer from harpoon' })

-- vim.keymap.set("n", "<leader>xa", function()
--   require("harpoon.mark").clear_all()
-- end, { desc = "Clear all buffers from harpoon" })

-- vim.keymap.set("n", "<leader>e", "<Cmd>Telescope harpoon marks<CR>", { desc = "Toggle harpoon in telescope" })

vim.keymap.set("n", "<C-j>", function()
  require("harpoon"):list():select(1)
end, { desc = "Navigate to harpoon buffer 1" })

vim.keymap.set("n", "<C-k>", function()
  require("harpoon"):list():select(2)
end, { desc = "Navigate to harpoon buffer 2" })

vim.keymap.set("n", "<C-m>", function()
  require("harpoon"):list():select(3)
end, { desc = "Navigate to harpoon buffer 3" })

vim.keymap.set("n", "<C-n>", function()
  require("harpoon"):list():select(4)
end, { desc = "Navigate to harpoon buffer 4" })

vim.keymap.set("n", "<C-p>", function()
  require("harpoon"):list():select(5)
end, { desc = "Navigate to harpoon buffer 5" })

-- Smart splits
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", function()
  require("smart-splits").resize_left()
end, { desc = "Resize window to left" })

vim.keymap.set("n", "<A-j>", function()
  require("smart-splits").resize_down()
end, { desc = "Resize window down" })

vim.keymap.set("n", "<A-k>", function()
  require("smart-splits").resize_up()
end, { desc = "Resize window up" })

vim.keymap.set("n", "<A-l>", function()
  require("smart-splits").resize_right()
end, { desc = "Resize window to right" })

-- Flutter
vim.keymap.set("n", "<leader>flr", "<CMD>FlutterRun<CR>", { desc = "Flutter Run" })
vim.keymap.set("n", "<leader>flo", "<CMD>FlutterReload<CR>", { desc = "Flutter Reload" })
vim.keymap.set("n", "<leader>fls", "<CMD>FlutterRestart<CR>", { desc = "Flutter Restart" })
vim.keymap.set("n", "<leader>flq", "<CMD>FlutterQuit<CR>", { desc = "Flutter Quit" })
vim.keymap.set("n", "<leader>fle", "<CMD>FlutterEmulators<CR>", { desc = "Flutter Emulators" })

-- Useless
vim.keymap.set("n", "<leader>fa", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Funny animation" })
