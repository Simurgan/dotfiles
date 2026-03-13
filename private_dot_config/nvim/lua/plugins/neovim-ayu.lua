return {
	"Shatur/neovim-ayu",
	config = function()
		require("ayu").setup({
			mirage = false, -- true = mirage variant
			terminal = true,
			overrides = {},
		})

		require("ayu").colorscheme()

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		local colors = require("ayu.colors")
		colors.generate()

		vim.api.nvim_set_hl(0, "Directory", { fg = colors.entity })
		vim.api.nvim_set_hl(0, "Normal", { fg = colors.func })

		vim.api.nvim_set_hl(0, "LineNr", {
			fg = colors.fg,
		})

		vim.api.nvim_set_hl(0, "CursorLineNr", {
			fg = colors.warning,
			bold = true,
		})
	end
}
