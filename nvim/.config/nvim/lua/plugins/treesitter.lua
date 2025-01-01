return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"javascript",
					"python",
					"typescript",
					"html",
					"gitignore",
					"vue",
					"rust",
					"markdown",
					"markdown_inline",
					"json",
					"sql",
					"css",
					"yaml",
					"toml",
					"terraform",
				},
				sync_install = false,
				ignore_install = {},
				auto_install = true,
				autotag = {
					enable = true,
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-backspace>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
				fold = {
					enable = true,
					fold_method = "expr",
					auto_fold = true,
				},
				context_commentstring = {
					enable = true,
				},
			})
		end,
	},
}
