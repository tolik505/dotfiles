-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste into selection and keep copied value in the register' })
vim.keymap.set('n', '<leader>rp', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Mass replace word under cursor' })
vim.keymap.set('n', '<leader>he', [[:vert help  | wincmd L<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]], { desc = 'Help' })
vim.keymap.set('n', '<leader>fp', '<cmd>echo @%<CR>', { desc = 'Show file path' })
vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quickfix list
vim.keymap.set('n', '<leader>co', '<Cmd>copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>cc', '<Cmd>cclose<CR>', { desc = 'Close quickfix list' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>ed', vim.diagnostic.enable, { desc = 'Enable diagnostics' })
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.enable(false)
end, { desc = 'Disable diagnostics' })

-- Diffview
vim.keymap.set('n', '<leader>dfo', '<Cmd>DiffviewOpen<CR>', { desc = 'Open diff view' })
vim.keymap.set('n', '<leader>dfc', '<Cmd>DiffviewClose<CR>', { desc = 'Close diff view' })

-- Buffers
vim.keymap.set('n', '<C-l>', '<Cmd>bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-h>', '<Cmd>bp<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>q', '<Cmd>bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>Q', '<Cmd>%bd <bar> e# <bar> bd# <CR>', { desc = 'Close all buffers except the current' })
vim.keymap.set('n', '<leader>bn', '<Cmd>enew<CR>', { desc = 'Create empty buffer' })

-- Harpoon
vim.keymap.set('n', '<leader>a', function()
  require('harpoon.mark').add_file()
end, { desc = 'Add buffer to harpoon' })

-- vim.keymap.set('n', '<C-j>', function()
-- require('harpoon.ui').nav_next()
-- end, { desc = 'Next harpoon buffer' })

-- vim.keymap.set('n', '<C-k>', function()
-- require('harpoon.ui').nav_prev()
-- end, { desc = 'Previous harpoon buffer' })

vim.keymap.set('n', '<leader>x', function()
  require('harpoon.mark').rm_file()
end, { desc = 'Remove buffer from harpoon' })

vim.keymap.set('n', '<leader>xa', function()
  require('harpoon.mark').clear_all()
end, { desc = 'Clear all buffers from harpoon' })

vim.keymap.set('n', '<leader>hm', function()
  require('harpoon.ui').toggle_quick_menu()
end, { desc = 'Toggle harpoon quick menu' })

vim.keymap.set('n', '<leader>e', '<Cmd>Telescope harpoon marks<CR>', { desc = 'Toggle harpoon in telescope' })

vim.keymap.set('n', '<C-j>', function()
  require('harpoon.ui').nav_file(1)
end, { desc = 'Navigate to harpoon buffer 1' })

vim.keymap.set('n', '<C-k>', function()
  require('harpoon.ui').nav_file(2)
end, { desc = 'Navigate to harpoon buffer 2' })

vim.keymap.set('n', '<C-m>', function()
  require('harpoon.ui').nav_file(3)
end, { desc = 'Navigate to harpoon buffer 3' })

vim.keymap.set('n', '<C-n>', function()
  require('harpoon.ui').nav_file(4)
end, { desc = 'Navigate to harpoon buffer 4' })

vim.keymap.set('n', '<C-p>', function()
  require('harpoon.ui').nav_file(5)
end, { desc = 'Navigate to harpoon buffer 5' })

-- Telescope See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', function()
  require('telescope.builtin').oldfiles()
end, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers()
end, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files()
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>sh', function()
  require('telescope.builtin').help_tags()
end, { desc = '[S]earch [H]elp' })

vim.keymap.set('n', '<leader>sw', function()
  require('telescope.builtin').grep_string()
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<leader>sg', function()
  require('telescope.builtin').live_grep()
end, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>sG', '<Cmd>LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })

vim.keymap.set('n', '<leader>sd', function()
  require('telescope.builtin').diagnostics()
end, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sr', function()
  require('telescope.builtin').resume()
end, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>sm', function()
  require('telescope.builtin').marks()
end, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sS', '<Cmd>Telescope persisted<CR>', { desc = '[S]earch [S]essions' })

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = 'Search on current file',
})
vim.keymap.set('v', '<leader>sp', '<esc><cmd>lua require("spectre").open_file_search()<CR>', {
  desc = 'Search current word on current file',
})
vim.keymap.set('n', '<leader>sP', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = 'Search current word',
})
vim.keymap.set('v', '<leader>sP', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = 'Search current word',
})

-- Sessions
vim.keymap.set('n', '<leader>ss', '<Cmd>SessionSave<CR>', { desc = '[S]ession [S]ave' })
vim.keymap.set('n', '<leader>sl', '<Cmd>SessionLoad<CR>', { desc = '[S]ession [L]oad' })

-- Tests
vim.keymap.set('n', '<leader>ta', function()
  require('neotest').run.run(vim.uv.cwd())
end, { desc = 'Run all tests' })

vim.keymap.set('n', '<leader>tS', function()
  require('neotest').run.run { suite = true }
end, { desc = 'Run tests in suite' })

vim.keymap.set('n', '<leader>tt', function()
  require('neotest').run.run()
end, { desc = 'Run nearest test' })

vim.keymap.set('n', '<leader>tl', function()
  require('neotest').run.run_last()
end, { desc = 'Run last test' })

vim.keymap.set('n', '<leader>tg', '<cmd>GoTestFunc<cr>', { desc = 'Run nearest Go test' })

vim.keymap.set('n', '<leader>tf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = 'Run tests in current file' })

vim.keymap.set('n', '<leader>ts', function()
  require('neotest').run.stop()
end, { desc = 'Stop test' })

vim.keymap.set('n', '<leader>to', function()
  require('neotest').output.open { enter = true, auto_close = true }
end, { desc = 'Open test output' })

vim.keymap.set('n', '<leader>tp', function()
  require('neotest').output_panel.toggle()
end, { desc = 'Toggle test output pannel' })

vim.keymap.set('n', '<leader>tc', function()
  require('neotest').output_panel.clear()
end, { desc = 'Clear test output pannel' })

vim.keymap.set('n', '<leader>tm', function()
  require('neotest').summary.toggle()
end, { desc = 'Test summary' })

vim.keymap.set('n', '<leader>td', function()
  require('neotest').run.run { suite = false, strategy = 'dap' }
end, { desc = 'Debug nearest test' })

-- Text Coverage
vim.keymap.set('n', '<leader>cl', '<Cmd>Coverage<CR>', { desc = '[C]overage [L]oad' })
vim.keymap.set('n', '<leader>ct', '<Cmd>CoverageToggle<CR>', { desc = '[C]overage [T]oggle' })
vim.keymap.set('n', '<leader>cd', '<Cmd>CoverageClear<CR>', { desc = '[C]overage [D]elete' })
vim.keymap.set('n', '<leader>cs', '<Cmd>CoverageSummary<CR>', { desc = '[C]overage [S]ummary' })

-- Debug
vim.keymap.set('n', '<leader>dn', '<Cmd>GoDebug -n<CR>', { desc = '[D]ebug [N]earest Test' })
vim.keymap.set('n', '<leader>dS', '<Cmd>GoDebug -s<CR>', { desc = '[D]ebug [S]top' })
vim.keymap.set('n', '<leader>dh', '<Cmd>GoDbgKeys<CR>', { desc = '[D]ebug [H]elp' })

vim.keymap.set('n', '<leader>dc', function()
  require('dap').continue()
end, { desc = 'Debug: Start/Continue' })

vim.keymap.set('n', '<leader>di', function()
  require('dap').step_into()
end, { desc = 'Debug: Step Into' })

vim.keymap.set('n', '<M-o>', function()
  require('dap').step_over()
end, { desc = 'Debug: Step Over' })

vim.keymap.set('n', '<leader>du', function()
  require('dap').step_out()
end, { desc = 'Debug: Step Out' })

vim.keymap.set('n', '<leader>dt', function()
  require('dap').terminate()
end, { desc = 'Debug: Terminate' })

vim.keymap.set('n', '<leader>dr', function()
  require('dapui').toggle()
end, { desc = 'Debug: See last session result.' })

vim.keymap.set('n', '<leader>db', function()
  require('dap').toggle_breakpoint()
end, { desc = 'Debug: Toggle Breakpoint' })

vim.keymap.set('n', '<leader>dB', function()
  require('dap').clear_breakpoints()
end, { desc = 'Debug: Clear Breakpoint' })

-- vim.keymap.set('n', '<leader>dg', function()
--   require('dap-go').debug_test()
-- end, { desc = 'Debug Nearest Go Test' })

vim.keymap.set('n', '<leader>dl', function()
  require('dap').run_last()
end, { desc = 'Debug Last Test' })

-- Diagnostic
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle 'diagnostics'
end, { desc = 'Toggle diagnostics' })
vim.keymap.set('n', '<leader>xn', function()
  require('trouble').next { skip_groups = true, jump = true }
end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>xp', function()
  require('trouble').previous { skip_groups = true, jump = true }
end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'Workspace diagnostics' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'Document diagnostics' })
vim.keymap.set('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end)

-- Flutter
vim.keymap.set('n', '<leader>fr', '<CMD>FlutterRun<CR>', { desc = 'Flutter Run' })
vim.keymap.set('n', '<leader>fo', '<CMD>FlutterReload<CR>', { desc = 'Flutter Reload' })
vim.keymap.set('n', '<leader>fs', '<CMD>FlutterRestart<CR>', { desc = 'Flutter Restart' })
vim.keymap.set('n', '<leader>fq', '<CMD>FlutterQuit<CR>', { desc = 'Flutter Quit' })
vim.keymap.set('n', '<leader>fe', '<CMD>FlutterEmulators<CR>', { desc = 'Flutter Emulators' })

-- Oil
vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- NvimTree
vim.keymap.set('n', '<leader>tu', '<cmd>Yazi<cr>', { desc = 'Open yazi at the current file' })
vim.keymap.set('n', '<leader>tr', '<cmd>Yazi cwd<cr>', { desc = "Open the file manager in nvim's working directory" })

-- Go
vim.keymap.set('n', '<leader>im', '<CMD>GoImplements<CR>', { desc = 'Go to interface implementation' })

-- Smart splits
-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', function()
  require('smart-splits').resize_left()
end, { desc = 'Resize window to left' })

vim.keymap.set('n', '<A-j>', function()
  require('smart-splits').resize_down()
end, { desc = 'Resize window down' })

vim.keymap.set('n', '<A-k>', function()
  require('smart-splits').resize_up()
end, { desc = 'Resize window up' })

vim.keymap.set('n', '<A-l>', function()
  require('smart-splits').resize_right()
end, { desc = 'Resize window to right' })

-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', function()
  require('smart-splits').swap_buf_left()
end, { desc = 'Swap windows left' })

vim.keymap.set('n', '<leader><leader>j', function()
  require('smart-splits').swap_buf_down()
end, { desc = 'Swap window down' })

vim.keymap.set('n', '<leader><leader>k', function()
  require('smart-splits').swap_buf_up()
end, { desc = 'Swap window up' })

vim.keymap.set('n', '<leader><leader>l', function()
  require('smart-splits').swap_buf_right()
end, { desc = 'Swap window right' })

-- TreeSJ
vim.keymap.set('n', '<leader>j', '<Cmd>TSJToggle<CR>', { desc = 'Toggle block split' })

-- Neorg
vim.keymap.set('n', '<leader>oi', '<Cmd>Neorg index<CR>', { desc = 'Open Neorg index' })
vim.keymap.set('n', '<leader>oc', '<Cmd>Neorg return<CR>', { desc = 'Close Neorg' })

-- Noice
vim.keymap.set('n', '<leader>nl', '<Cmd>Noice last<CR>', { desc = 'Last notification' })
vim.keymap.set('n', '<leader>nh', function()
  Snacks.notifier.show_history()
end, { desc = 'Notifications history' })
vim.keymap.set('n', '<leader>nd', function()
  Snacks.notifier.hide()
end, { desc = 'Notifications dismiss' })

-- Git
vim.keymap.set('n', '<leader>g', function()
  Snacks.lazygit()
end, { desc = 'Open Lazygit' })

vim.keymap.set('n', '<leader>gl', function()
  Snacks.lazygit()
end, { desc = 'Open git log' })

vim.keymap.set('n', '<leader>gf', function()
  Snacks.lazygit()
end, { desc = 'Open git log file' })

vim.keymap.set('n', '<leader>gy', function()
  require('gitlinker').get_buf_range_url('n', {})
end, { desc = 'Copy file link' })

vim.keymap.set('n', '<leader>gY', function()
  require('gitlinker').get_repo_url()
end, { desc = 'Copy repo link' })

vim.keymap.set('n', '<leader>gb', function()
  require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })
end, { desc = 'Open file link in browser', silent = true })

vim.keymap.set('v', '<leader>gb', function()
  require('gitlinker').get_buf_range_url('v', { action_callback = require('gitlinker.actions').open_in_browser })
end, { desc = 'Open file link in browser', silent = true })

vim.keymap.set('n', '<leader>gB', function()
  require('gitlinker').get_repo_url { action_callback = require('gitlinker.actions').open_in_browser }
end, { desc = 'Open repo link in browser', silent = true })

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undo tree' })

-- Format
vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
  require('conform').format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = 'Format file or range (in visual mode)' })

-- Origami
vim.keymap.set('n', 'h', function()
  require('origami').h()
end)
vim.keymap.set('n', '$', function()
  require('origami').dollar()
end)

-- Markdown preview
vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'Markdown preview toggle' })

-- Useless
vim.keymap.set('n', '<leader>fa', '<cmd>CellularAutomaton game_of_life<CR>', { desc = 'Funny animation' })
