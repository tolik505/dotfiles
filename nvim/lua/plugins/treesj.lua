return {
	'Wansmer/treesj',
	lazy = true,
	cmd = { 'TSJToggle' },
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	config = function()
		require('treesj').setup({
			use_default_keymaps = false,
		})
	end,
}
