-- nohlsearch
vim.keymap.set('n', '<Esc>', '<Esc>:noh<cr>', { noremap = true, silent = true })

-- add \displaystyle
vim.keymap.set('i', '<c-d>', 'CUR-POS<Esc>?\\$\\\\displaystyle \\|\\$<cr>cgn$\\displaystyle<space><Esc>/CUR-POS<cr><Esc>cgn', { silent = true })

-- inline -> display in .tex
vim.api.nvim_create_user_command('DisplayTeX', function()
    vim.api.nvim_input('?\\$\\\\displaystyle \\|\\$<cr>cgn')
    vim.api.nvim_input('<cr>\\[<Esc>/\\$<cr>cgn\\]<cr><Esc><Esc>')
end, {})
vim.cmd("cnoreabbrev dt DisplayTeX")

-- inline -> display in .md
vim.api.nvim_create_user_command('DisplayMD', function()
    vim.api.nvim_input('?\\$\\\\displaystyle \\|\\$<cr>cgn')
    vim.api.nvim_input('$$<esc>/\\$<cr>a$<esc><esc>')
end, {})
vim.cmd("cnoreabbrev dm DisplayMD")

-- bold text in .md
vim.keymap.set('v', ';b', 'di****<Esc>hhp', { noremap = true, silent = true })

-- add brace
vim.keymap.set('v', ';c', 'diCUR-POS{}<Esc>hp?CUR-POS<CR>cgn', { noremap = true, silent = true })

-- scroll sync in MD
vim.api.nvim_create_user_command('ScrollSync', function()
    vim.fn.VSCodeNotify('markdown-preview-enhanced.toggleScrollSync')
end, {})
vim.cmd("cnoreabbrev ss ScrollSync")

-- MD preview
vim.api.nvim_create_user_command('PreviewMD', function()
    vim.fn.VSCodeNotify('markdown-preview-enhanced.openPreviewToTheSide')
end, {})
vim.cmd("cnoreabbrev pmd PreviewMD")

-- synctex
vim.api.nvim_create_user_command('JumpToPDF', function()
    vim.fn.VSCodeNotify('latex-workshop.synctex')
end, {})
vim.cmd("cnoreabbrev fd JumpToPDF")

-- LaTeX preview
vim.api.nvim_create_user_command('ViewPDF', function()
    vim.fn.VSCodeNotify('latex-workshop.view')
end, {})
vim.cmd("cnoreabbrev plt ViewPDF")


-- primary side bar
vim.api.nvim_create_user_command('Sidebar', function()
    vim.fn.VSCodeNotify('workbench.action.toggleSidebarVisibility')
end, {})
vim.cmd("cnoreabbrev sd Sidebar")


-- reload window
vim.api.nvim_create_user_command('Reload', function()
    vim.fn.VSCodeNotify('workbench.action.reloadWindow')
end, {})
vim.cmd("cnoreabbrev rw Reload")

-- open recent
vim.api.nvim_create_user_command('OpenRecent', function()
    vim.fn.VSCodeNotify('workbench.action.openRecent')
end, {})
vim.cmd("cnoreabbrev or OpenRecent")

-- tinymist preview
vim.api.nvim_create_user_command('TypstPreview', function()
    vim.fn.VSCodeNotify('typst-preview.preview')
end, {})
vim.cmd("cnoreabbrev pty TypstPreview")

-- inline -> display in .typ
vim.api.nvim_create_user_command('DisplayTypst', function()
    vim.api.nvim_input('?\\$<cr>s<cr>$<space><Esc>/\\$<cr>s<space>$<cr><Esc>:noh<cr>')
end, {})
vim.cmd("cnoreabbrev dy DisplayTypst")