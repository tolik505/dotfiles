-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = 'Paste and keep copied value in the register' })
vim.keymap.set("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = 'Mass replace word under cursor' })

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

-- Buffers
vim.keymap.set('n', '<C-l>', '<Cmd>bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-h>', '<Cmd>bp<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-m>', '<Cmd>bd<CR>', { desc = 'Close buffer' })

-- Harpoon
vim.keymap.set('n', '<C-a>', function() require('harpoon.mark').add_file() end, { desc = 'Add buffer to harpoon' })
vim.keymap.set('n', '<C-j>', function() require('harpoon.ui').nav_next() end, { desc = 'Next harpoon buffer' })
vim.keymap.set('n', '<C-k>', function() require('harpoon.ui').nav_prev() end, { desc = 'Previous harpoon buffer' })
vim.keymap.set('n', '<leader>x', function() require('harpoon.mark').rm_file() end,
	{ desc = 'Remove buffer from harpoon' })
vim.keymap.set('n', '<leader>xa', function() require('harpoon.mark').clear_all() end,
	{ desc = 'Clear all buffers from harpoon' })
vim.keymap.set('n', '<leader>e', function() require('harpoon.ui').toggle_quick_menu() end,
	{ desc = 'Toggle harpoon quick menu' })
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
vim.keymap.set('n', '<leader>?', function() require('telescope.builtin').oldfiles() end,
	{ desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function() require('telescope.builtin').buffers() end,
	{ desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', function() require('telescope.builtin').git_files() end,
	{ desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', function() require('telescope.builtin').find_files() end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', function() require('telescope.builtin').help_tags() end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function() require('telescope.builtin').grep_string() end,
	{ desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function() require('telescope.builtin').live_grep() end,
	{ desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', function() require('telescope.builtin').diagnostics() end,
	{ desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', function() require('telescope.builtin').resume() end, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>ss', '<Cmd>Telescope persisted<CR>', { desc = '[S]earch [S]essions' })

-- Terminal
-- vim.keymap.set('n', '<C-t>', '<Cmd>ToggleTerm direction=float<cr>', { desc = 'Open terminal' })
-- vim.keymap.set('t', '<C-t>', '<cmd>ToggleTerm<cr>', { desc = 'Close terminal' })

-- Tests
vim.keymap.set('n', "<leader>tt", function() require("neotest").run.run() end, { desc = 'Run nearest test' })
vim.keymap.set('n', "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,
	{ desc = 'Run tests in current file' })
vim.keymap.set('n', "<leader>ts", function() require("neotest").run.stop() end, { desc = "Stop test" })
vim.keymap.set('n', "<leader>to", function() require("neotest").output.open() end, { desc = "Open test output" })
vim.keymap.set('n', "<leader>tp", function() require("neotest").output_panel.toggle() end,
	{ desc = "Toggle test output pannel" })
vim.keymap.set('n', "<leader>tc", function() require("neotest").output_panel.clear() end, {
	desc = "Clear test output pannel",
})
vim.keymap.set('n', '<leader>tm', function() require("neotest").summary.toggle() end, { desc = 'Test summary' })
vim.keymap.set('n', '<leader>td', function() require("neotest").run.run({ strategy = "dap" }) end,
	{ desc = 'Debug nearest test' })
vim.keymap.set('n', '<leader>gt', '<cmd>GoUnit<cr>', { desc = 'Generate go test' })

-- Debug
vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>do', function() require("dap").step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>du', function() require("dap").step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>dt', function() require("dap").terminate() end, { desc = 'Debug: Terminate' })
vim.keymap.set('n', '<leader>dr', function() require("dapui").toggle() end, { desc = 'Debug: See last session result.' })
vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end,
	{ desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>tdg', function() require('dap-go').debug_test() end,
	{ desc = "Debug Nearest Go Test" })
vim.keymap.set('n', '<leader>dl', function() require("dap").run_last() end,
	{ desc = "Debug Last Test" })

-- Neotree
vim.keymap.set('n', '<leader>n', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>b', '<Cmd>Neotree toggle show buffers right<CR>')

-- Smart splits
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', function() require('smart-splits').resize_left() end, { desc = 'Resize window to left' })
vim.keymap.set('n', '<A-j>', function() require('smart-splits').resize_down() end, { desc = 'Resize window down' })
vim.keymap.set('n', '<A-k>', function() require('smart-splits').resize_up() end, { desc = 'Resize window up' })
vim.keymap.set('n', '<A-l>', function() require('smart-splits').resize_right() end, { desc = 'Resize window to right' })
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', function() require('smart-splits').swap_buf_left() end,
	{ desc = 'Swap windows left' })
vim.keymap.set('n', '<leader><leader>j', function() require('smart-splits').swap_buf_down() end,
	{ desc = 'Swap window down' })
vim.keymap.set('n', '<leader><leader>k', function() require('smart-splits').swap_buf_up() end,
	{ desc = 'Swap window up' })
vim.keymap.set('n', '<leader><leader>l', function() require('smart-splits').swap_buf_right() end,
	{ desc = 'Swap window right' })

-- TreeSJ
vim.keymap.set('n', '<leader>j', '<Cmd>TSJToggle<CR>', { desc = 'Toggle block split' })

-- Neorg
vim.keymap.set('n', '<leader>oi', '<Cmd>Neorg index<CR>', { desc = 'Open Neorg index' })
vim.keymap.set('n', '<leader>oc', '<Cmd>Neorg return<CR>', { desc = 'Close Neorg' })

-- Noice
vim.keymap.set('n', '<leader>nl', '<Cmd>Noice last<CR>', { desc = 'Last Noice message' })
vim.keymap.set('n', '<leader>nh', '<Cmd>Noice history<CR>', { desc = 'Noice history' })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end, { desc = 'Close all folds' })

-- Neogit
vim.keymap.set('n', '<leader>g', '<Cmd>Neogit<CR>', { desc = 'Open Neogit' })

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Useless
vim.keymap.set("n", "<leader>fa", "<cmd>CellularAutomaton game_of_life<CR>", { desc = 'Funny animation' });
