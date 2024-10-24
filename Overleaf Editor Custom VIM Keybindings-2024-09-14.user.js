// ==UserScript==
// @name         Overleaf Editor Custom VIM Keybindings
// @namespace    http://tampermonkey.net/
// @version      2024-09-14
// @description  https://greasyfork.org/en/scripts/461062-overleaf-editor-custom-vim-keybindings-code-mirror-v6
// @match        https://www.overleaf.com/project/*
// @grant none
// ==/UserScript==

/* globals jQuery, $, waitForKeyElements */

(function() {
    'use strict';
    // Your code here...
    window.addEventListener("UNSTABLE_editor:extensions", (event) => {
        const { CodeMirror, CodeMirrorVim, extensions } = event.detail;
        CodeMirrorVim.Vim.map("jk", "<Esc>", "insert");
        CodeMirrorVim.Vim.map("jj", "<Esc>A", "insert");
        CodeMirrorVim.Vim.map("vv", "^{-1}", "insert");
        CodeMirrorVim.Vim.map("j", "gj", "normal");
        CodeMirrorVim.Vim.map("k", "gk", "normal");
        CodeMirrorVim.Vim.map("zL", "?\\$<CR>xv$do\\[<Esc>o<Esc>pA<Space><Esc>0", "normal");
        CodeMirrorVim.Vim.map("zR", "/\\$<CR>xv$do\\]<Esc>o<Esc>p^", "normal");
        CodeMirrorVim.Vim.map("zI", "?\\[<CR>dd^v$dkA<Space>$<Esc>pjdd/\\]<CR>kA$<Space><Space><CR><Esc>jddI<Space><Esc>^hv?\\$<CR>lls", "normal");

        CodeMirrorVim.Vim.map("UU", "<Esc>uuGA", "insert"); // undo
        CodeMirrorVim.Vim.map("dps", "TMP-FLAG<Esc>?\\$<CR>a\\displaystyle<Space><Esc>/TMP-FLAG<CR>fGvFTs", "insert"); // displastyle
        CodeMirrorVim.Vim.map("zm", ">gvdko\\begin{itemize}<Esc>o\\end{itemize}<Esc>kpI\\item<Space>", "visual"); // itemize, not containing last line
        // User-defined commands
        CodeMirrorVim.Vim.defineEx("home", undefined, buctton_click_ProjectList);
        CodeMirrorVim.Vim.defineEx("fd", undefined, buctton_click_forward_search); // ref: https://discuss.codemirror.net/t/vim-how-to-use-defineex/738/2
        CodeMirrorVim.Vim.defineEx("ex", undefined, function(cm) {
            CodeMirrorVim.Vim.handleKey(cm, 'z');
            CodeMirrorVim.Vim.handleKey(cm, 'L');
            CodeMirrorVim.Vim.handleKey(cm, 'z');
            CodeMirrorVim.Vim.handleKey(cm, 'R');
        });
        CodeMirrorVim.Vim.defineEx("in", undefined, function(cm) {
            CodeMirrorVim.Vim.handleKey(cm, 'z');
            CodeMirrorVim.Vim.handleKey(cm, 'I');
        });
        /*
        // 2. Restore Ctrl+C to copy into system clipboard
        // Solution: Undo mappings for Ctrl+C completely.
        // Ref: https://discuss.codemirror.net/t/vim-how-to-copy-selected-text-in-visual-mode-with-ctrl-c-on-windows/5855/6
        // Caveat: upon unmapping <C-c>, copying with Ctrl+C works. Yet, if one were to copy from Visual mode, an extract j/k movement is needed to "escape" from Visual mode.
        CodeMirrorVim.Vim.unmap('<C-c>');
        CodeMirrorVim.Vim.map("<C-c>", "<C-c><Esc>");
        */
        CodeMirrorVim.Vim.defineAction('CopySelection', copy_in_visual_mode);
        CodeMirrorVim.Vim.mapCommand("<c-c>", 'action', 'CopySelection');
    });
})();

function buctton_click_ProjectList(cm) {
    document.querySelector('i[class*="fa-home"]').click()
};
function buctton_click_forward_search(cm) {
    document.querySelector('.fa-arrow-right').click()
};

function copy_in_visual_mode(cm) {
    document.execCommand('copy');
    alert("Triggered the copy function");
}