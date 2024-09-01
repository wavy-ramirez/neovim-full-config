return {
	'stevearc/dressing.nvim',
	opts = {},
	config = function ()
		require("dressing").setup{
			builtin = {
				-- Display numbers for options and set up keymaps
				show_numbers = true,
				-- These are passed to nvim_open_win
				border = "rounded",
				-- 'editor' and 'win' will default to being centered
				relative = "editor",

				buf_options = {},
				win_options = {
						cursorline = true,
						cursorlineopt = "both",
				},
			}
		}
	end,
}
