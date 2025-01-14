vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc>', ':noh<cr>', { noremap = true, silent = true })

-- translated from .vimrc
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.cin = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.syntax = "on"
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<Esc>O', { noremap = true, silent = true })

vim.cmd('colorscheme slate')
-- dark: default, desert, elflord, evening, industry, koehler, slate
