return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind in [f]iles" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[f]ind by [g]rep" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[f]ind in [k]eymaps" },
	}
}
