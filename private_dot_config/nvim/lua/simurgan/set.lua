vim.g.mapleader = " "
vim.g.maploadlleader = " "

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scrolloff = 8

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

local undodir = vim.fn.stdpath("state") .. "/undodir"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")
