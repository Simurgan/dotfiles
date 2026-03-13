vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open explorer" })
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Go back to the last file from explorer" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Close search highlighting until next search" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Move next line to the end of the current line" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste to selection without changing register" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without changing register" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without changing register" })
vim.keymap.set("n", "<leader>x", '"_x', { desc = "Delete character without changing register" })
vim.keymap.set("v", "<leader>x", '"_x', { desc = "Delete without changing register" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Copy to system clipboard" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable going in Ex mode" })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Make Ctrl+C safer" })
