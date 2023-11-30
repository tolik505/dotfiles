return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
			"haydenmeade/neotest-jest",
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " ")
							:gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				discovery = {
					enabled = false,
				},
				adapters = {
					require("neotest-go"),
					require('neotest-jest')({
						jest_test_discovery = false,
						jestCommand = "npm test --",
						jestConfigFile = function()
							local file = vim.fn.expand('%:p')
							if string.find(file, "e2e") then
								print('Test e2e')
								return string.match(file, ".*/libs/[^/]+") ..
									"jest.e2e.config.ts"
							end
							print('Test unit')
							return string.match(file, ".*/libs/[^/]+") ..
								"jest.config.ts"
						end,
						env = { CI = true },
						cwd = function(path) return vim.fn.getcwd() end,
					}),
				},
			})
		end,
	}
}
