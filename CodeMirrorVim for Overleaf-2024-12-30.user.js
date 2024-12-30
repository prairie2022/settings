// ==UserScript==
// @name          CodeMirrorVim for Overleaf
// @namespace     http://tampermonkey.net/
// @version       2024-12-30
// @description   modified from https://greasyfork.org/en/scripts/461062-overleaf-editor-custom-vim-keybindings-code-mirror-v6
// @author        prairie2022
// @match         https://www.overleaf.com/project/*
// @grant         none
// ==/UserScript==

/* globals jQuery, $, waitForKeyElements */

(function() {
    'use strict';
    // Your code here...
    window.addEventListener("UNSTABLE_editor:extensions", (event) => {
        const { CodeMirror, CodeMirrorVim, extensions } = event.detail;
        // escape
        CodeMirrorVim.Vim.map("jk", "<Esc>", "insert");
        CodeMirrorVim.Vim.map("jj", "<Esc>A<Space><Esc>v?[^ ]<CR>ld/\"\"<CR>A<Space>", "insert");
        CodeMirrorVim.Vim.map("j", "gj", "normal");
        CodeMirrorVim.Vim.map("k", "gk", "normal");
        CodeMirrorVim.Vim.map("ii", "diTMP-FLAG{}<Esc>hp?TMP-FLAG<CR>fGvFTs", "visual"); // text -> {text}
        CodeMirrorVim.Vim.map("\"", "<Esc>/\\)|\\]|\\}|\\$|\\{\\}|\\[\\]|\\(\\)|$<CR>/\"\"<CR>a", "insert");
        // transform
        CodeMirrorVim.Vim.map("zL", "?\\$<CR>xv$do\\[<Esc>o<Esc>pA<Space><Esc>0", "normal");
        CodeMirrorVim.Vim.map("zR", "/\\$<CR>xv$do\\]<Esc>o<Esc>p^", "normal");
        CodeMirrorVim.Vim.map("zI", "?\\[<CR>dd^v$dkA<Space>$<Esc>pjdd/\\]<CR>kA$<Space><Space><CR><Esc>jddI<Space><Esc>^hv?\\$<CR>lls", "normal");
        CodeMirrorVim.Vim.map("zA", "?\\[<CR>lsbegin{align*}<Esc>jV/\\]<CR>k>/\\]<CR>lsend{align*}<Esc>", "normal");
        CodeMirrorVim.Vim.map("zm", ">gvdko\\begin{itemize}<Esc>o\\end{itemize}<Esc>kpI\\item<Space>", "visual"); // itemize, not containing last line
        // function
        CodeMirrorVim.Vim.map("UU", "<Esc>uuGA", "insert"); // undo
        CodeMirrorVim.Vim.map(",d", "TMP-FLAG<Esc>?\\$<CR>a\\displaystyle<Space><Esc>/TMP-FLAG<CR>fGvFTs", "insert"); // displastyle
        // error
        CodeMirrorVim.Vim.map("^^", "^{}<Esc>i", "insert");
        CodeMirrorVim.Vim.map("__", "_{}<Esc>i", "insert");
        CodeMirrorVim.Vim.map(",v", "^{-1}", "insert");
        CodeMirrorVim.Vim.map("TH", "Th", "insert");
        CodeMirrorVim.Vim.map("taht", "that", "insert");
        // abbreviation
        CodeMirrorVim.Vim.map(",a", "\\forall\\,<Space>", "insert");
        CodeMirrorVim.Vim.map(",b", "\\begin{", "insert");
        CodeMirrorVim.Vim.map(",e", "\\exists\\,<Space>", "insert");
        CodeMirrorVim.Vim.map(",t", "\\text{}<Esc>i", "insert");
        CodeMirrorVim.Vim.map(",q", "\"", "insert");
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
        CodeMirrorVim.Vim.defineEx("al", undefined, function(cm) {
            CodeMirrorVim.Vim.handleKey(cm, 'z');
            CodeMirrorVim.Vim.handleKey(cm, 'A');
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
        CodeMirrorVim.Vim.mapCommand("<c-C>", 'action', 'CopySelection');
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
};