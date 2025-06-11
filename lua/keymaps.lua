vim.g.mapleader = ','
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
