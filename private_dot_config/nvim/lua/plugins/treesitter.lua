return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			ensure_installed = {
				"lua", "nix",
				"c", "java", "go",
				"python", "bash", "fish",
				"dockerfile", "yaml", "json", "toml",
				"javascript", "typescript", "css", "html",
				"markdown", "latex", "sql",
			},
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

				vim.wo[0].foldmethod = "expr"
				vim.wo[0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
