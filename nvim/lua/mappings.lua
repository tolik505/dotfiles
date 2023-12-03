local harpoon_mark = require(
	"harpoon.mark"
)
local harpoon_ui = require("harpoon.ui")
local neotest = require("neotest")
local dap = require 'dap'
local dapui = require 'dapui'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = 'Paste and keep copied value in the register' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Diffview
vim.keymap.set('n', '<leader>dfo', '<Cmd>DiffviewOpen<CR>', { desc = 'Open diff view' })
vim.keymap.set('n', '<leader>dfc', '<Cmd>DiffviewClose<CR>', { desc = 'Close diff view' })

-- Tabs
vim.keymap.set('n', 'tl', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', 'th', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', 'tx', '<Cmd>BufferLinePickClose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', 'tg', '<Cmd>BufferLinePick<CR>', { desc = 'Pick tab' })

-- Harpoon
vim.keymap.set('n', '<C-a>', harpoon_mark.add_file, { desc = 'Mark buffer' })
vim.keymap.set('n', '<C-l>', harpoon_ui.nav_next, { desc = 'Next harpoon buffer' })
vim.keymap.set('n', '<C-h>', harpoon_ui.nav_prev, { desc = 'Previous harpoon buffer' })
vim.keymap.set('n', '<C-x>', harpoon_mark.rm_file, { desc = 'Remove buffer from harpoon' })
vim.keymap.set('n', '<C-c>', harpoon_mark.clear_all, { desc = 'Clear all buffers from harpoon' })
vim.keymap.set('n', '<leader>e', harpoon_ui.toggle_quick_menu, { desc = 'Toggle harpoon quick menu' })
vim.keymap.set('n', '<leader>1', function() require('harpoon.ui').nav_file(1) end,
	{ desc = 'Navigate to harpoon buffer 1' })
vim.keymap.set('n', '<leader>2', function() require('harpoon.ui').nav_file(2) end,
	{ desc = 'Navigate to harpoon buffer 2' })
vim.keymap.set('n', '<leader>3', function() require('harpoon.ui').nav_file(3) end,
	{ desc = 'Navigate to harpoon buffer 3' })
vim.keymap.set('n', '<leader>4', function() require('harpoon.ui').nav_file(4) end,
	{ desc = 'Navigate to harpoon buffer 4' })
vim.keymap.set('n', '<leader>5', function() require('harpoon.ui').nav_file(5) end,
	{ desc = 'Navigate to harpoon buffer 5' })


-- Telescope See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Terminal
vim.keymap.set('n', '<C-t>', '<Cmd>ToggleTerm direction=float<cr>', { desc = 'Open terminal' })
vim.keymap.set('t', '<C-t>', '<cmd>ToggleTerm<cr>', { desc = 'Close terminal' })

-- Tests
vim.keymap.set('n', "<leader>tt", neotest.run.run, { desc = 'Run nearest test' })
vim.keymap.set('n', "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end,
	{ desc = 'Run tests in current file' })
vim.keymap.set('n', "<leader>ts", neotest.run.stop, { desc = "Stop test" })
vim.keymap.set('n', "<leader>to", neotest.output.open, { desc = "Open test output" })
vim.keymap.set('n', "<leader>tp", neotest.output_panel.toggle, { desc = "Toggle test output pannel" })
vim.keymap.set('n', "<leader>tc", neotest.output_panel.clear, {
	desc = "Clear test output pannel",
})
vim.keymap.set('n', '<leader>tm', neotest.summary.toggle, { desc = 'Test summary' })
vim.keymap.set('n', '<leader>td', function() neotest.run.run({ strategy = "dap" }) end, { desc = 'Debug nearest test' })
vim.keymap.set('n', '<leader>gt', '<cmd>GoUnit<cr>', { desc = 'Generate go test' })

-- Debug
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>du', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Debug: Terminate' })
vim.keymap.set('n', '<leader>dr', dapui.toggle, { desc = 'Debug: See last session result.' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>tdg', function() require('dap-go').debug_test() end,
	{ desc = "Debug Nearest Go Test" })
vim.keymap.set('n', '<leader>dl', dap.run_last,
	{ desc = "Debug Last Test" })

-- Neotree
vim.keymap.set('n', '<leader>n', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>b', '<Cmd>Neotree toggle show buffers right<CR>')

-- Smart splits
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left, { desc = 'Resize window to left' })
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down, { desc = 'Resize window down' })
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up, { desc = 'Resize window up' })
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right, { desc = 'Resize window to right' })
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left, { desc = 'Swap windows left' })
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down, { desc = 'Swap window down' })
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up, { desc = 'Swap window up' })
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right, { desc = 'Swap window right' })

-- TreeSJ
vim.keymap.set('n', '<leader>bs', require('treesj').toggle, { desc = 'Toggle block split' })

-- Tabs
vim.keymap.set('n', 'tl', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', 'th', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', 'tx', '<Cmd>BufferLinePickClose<CR>', { desc = 'Pick a buffer to close' })
vim.keymap.set('n', 'tg', '<Cmd>BufferLinePick<CR>', { desc = 'Pick a buffer' })

-- Neorg
vim.keymap.set('n', '<leader>oi', '<Cmd>Neorg index<CR>', { desc = 'Open Neorg index' })
vim.keymap.set('n', '<leader>oc', '<Cmd>Neorg return<CR>', { desc = 'Close Neorg' })

-- Noice
vim.keymap.set('n', '<leader>nl', '<Cmd>Noice last<CR>', { desc = 'Last Noice message' })
vim.keymap.set('n', '<leader>nh', '<Cmd>Noice history<CR>', { desc = 'Noice history' })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

-- Neogit
vim.keymap.set('n', '<leader>g', '<Cmd>Neogit<CR>', { desc = 'Open Neogit' })

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
