return {
	"RRethy/vim-illuminate",
	config = function()
		require('illuminate').configure({
			-- providers: provider used to get references in the buffer, ordered by priority
			-- delay: delay in milliseconds
			delay = 300,
			-- under_cursor: whether or not to illuminate under the cursor
			under_cursor = false,
			min_count_to_highlight = 2,
		})
	end
}
