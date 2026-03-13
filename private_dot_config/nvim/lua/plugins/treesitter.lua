return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		ts.install({
			"lua", "nix",
			"c", "java", "go",
			"python", "bash", "fish",
			"dockerfile", "yaml", "json", "toml",
			"javascript", "typescript", "css", "html",
			"markdown", "latex", "sql",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local buf = args.buf
				local ft = vim.bo[buf].filetype
				local bt = vim.bo[buf].buftype

				if bt ~= "" or ft == "" then
					return
				end

				local ok = pcall(vim.treesitter.language.add, ft)
				if not ok then
					return
				end

				pcall(vim.treesitter.start, buf, ft)

				-- folds
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

				-- indentation
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
