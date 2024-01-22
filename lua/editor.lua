vim.opt.number = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.g.tokyonight_style = "night"

vim.api.nvim_command('autocmd Filetype javascript setlocal ts=2 sw=2 expandtab')
vim.api.nvim_command('autocmd Filetype typescriptreact setlocal ts=2 sw=2 expandtab')
vim.api.nvim_command('autocmd Filetype typescript setlocal ts=2 sw=2 expandtab')
vim.api.nvim_command('autocmd Filetype css setlocal ts=2 sw=2 expandtab')
vim.api.nvim_command('set backspace=indent,eol,start')
vim.api.nvim_command('filetype plugin indent on')
