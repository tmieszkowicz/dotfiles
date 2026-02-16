vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<leader>s', ':w<cr>')
vim.keymap.set('n', '<leader>oc', ':e C:\\Users\\tommi\\AppData\\Local\\nvim\\init.lua<cr>')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

if vim.g.vscode then
    local vscode = require('vscode')
    
    local mappings = {
        --- DEBUGGING ---
        { 'n', '<leader>db', 'editor.debug.action.toggleBreakpoint' },
        { 'n', '<leader>dc', 'workbench.action.debug.continue' },
        { 'n', '<leader>di', 'workbench.action.debug.stepInto' },
        { 'n', '<leader>do', 'workbench.action.debug.stepOver' },
        { 'n', '<leader>dq', 'workbench.action.debug.stop' },
        { 'n', '<leader>du', 'workbench.action.debug.stepOut' },
        { 'n', '<leader>dr', 'workbench.action.debug.restart' },
        
        --- NAVIGATION & SEARCH ---
        { 'n', 'gd', 'editor.action.revealDefinition' },
        { 'n', 'gr', 'editor.action.goToReferences' },
        { 'n', 'gi', 'editor.action.goToImplementation' },
        { 'n', 'gs', 'workbench.action.gotoSymbol' },
        { 'n', '<leader>fg', 'actions.find' },
        { 'n', '<leader>fw', 'workbench.action.findInFiles' },
        { 'n', '<leader>ff',  'workbench.action.quickOpen' },
        
        --- PEEK/PREVIEW ---
        { 'n', '<leader>vd', 'editor.action.peekDefinition' },
        { 'n', '<leader>vi', 'editor.action.peekImplementation' },
        
        --- NAVIGATION HISTORY ---
        { 'n', '<leader>nb', 'workbench.action.navigateBack' },
        { 'n', '<leader>nf', 'workbench.action.navigateForward' },
        
        --- DIAGNOSTICS ---
        { 'n', '[d', 'editor.action.marker.next' },
        { 'n', ']d', 'editor.action.marker.prev' },
        
        --- EDITOR CONTROL ---
        { 'n', '<leader>e', 'workbench.action.toggleSidebarVisibility' },
        { 'n', '<leader>t', 'workbench.action.terminal.toggleTerminal' },
        { 'n', '<leader>rn', 'editor.action.rename' },
        { 'n', '<leader>.', 'editor.action.quickFix' },
        { 'n', '<leader>fd', 'editor.action.formatDocument' },
        
        --- WINDOW/SPLIT MANAGEMENT ---
        { 'n', '<leader>wv', 'workbench.action.splitEditor' },
        { 'n', '<leader>wh', 'workbench.action.splitEditorDown' },
        { 'n', '<leader>wc', 'workbench.action.closeActiveEditor' },
        
        --- SUB-WORD NAVIGATION ---
        { 'n', 'w', 'cursorWordPartRight' },
        { 'n', 'b', 'cursorWordPartLeft' },
        { 'v', 'w', 'cursorWordPartRight' },
        { 'v', 'b', 'cursorWordPartLeft' },
    }
    
    for _, mapping in ipairs(mappings) do
        local mode, key, command = mapping[1], mapping[2], mapping[3]
        vim.keymap.set(mode, key, function()
            vscode.action(command)
        end, { silent = true })
    end
end