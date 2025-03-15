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
vim.cmd("cnoreabbrev pv PreviewMD")

-- MD preview (new tab)
vim.api.nvim_create_user_command('PreviewInNewTab', function()
    vim.fn.VSCodeNotify('markdown-preview-enhanced.openPreview')
end, {})
vim.cmd("cnoreabbrev PV PreviewInNewTab")

-- synctex
vim.api.nvim_create_user_command('JumpToPDF', function()
    vim.fn.VSCodeNotify('latex-workshop.synctex')
end, {})
vim.cmd("cnoreabbrev fd JumpToPDF")

-- LaTeX preview
vim.api.nvim_create_user_command('ViewPDF', function()
    vim.fn.VSCodeNotify('latex-workshop.view')
end, {})
vim.cmd("cnoreabbrev vw ViewPDF")


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
