return {
	{
		'tpope/vim-fugitive',
		event = "VeryLazy",
	},
	{
		'tpope/vim-rhubarb',
		event = "VeryLazy",
	},
	{
		'shumphrey/fugitive-gitlab.vim',
		event = "VeryLazy",
	},
	{
		'sindrets/diffview.nvim',
		event = "VeryLazy",
	},
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua",     -- optional
		},
		config = true
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		event = "VeryLazy",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add          = { text = ' │' },
				change       = { text = ' │' },
				delete       = { text = ' │' },
				topdelete    = { text = ' ‾' },
				changedelete = { text = ' ~' },
				untracked    = { text = ' ┆' },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, { expr = true, desc = 'Next hunk' })

				map('n', '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, { expr = true, desc = 'Previous hunk' })

				-- Actions
				map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
				map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
				map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = 'Stage hunk visula mode' })
				map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = 'Reset hunk visula mode' })
				map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage buffer' })
				map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
				map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset buffer' })
				map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
				map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Blame line' })
				map('n', '<leader>hd', gs.diffthis, { desc = 'Show diff' })
				map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Show diff' })

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
			end
		},
	}
}
