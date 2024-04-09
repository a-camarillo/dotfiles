local function set_vim_g() vim.g.mapleader = "," end

local function set_vim_o()
    local settings = {
        expandtab = true,
        shiftwidth = 2,
        clipboard = 'unnamedplus',
        splitright = true
    }

    for k, v in pairs(settings) do vim.o[k] = v end
end

local function set_vim_wo()
    local settings = {number = true, relativenumber = true, wrap = false}
    for k, v in pairs(settings) do vim.wo[k] = v end
end

local function set_vim_keymaps()
    local options_noremap = {noremap = false, silent = true}
    local options_remap = {noremap = true, silent = true}
    -- Windows and Split --
    vim.keymap.set('n', '<leader>v', '<cmd>vsplit<cr>', options_noremap)
    vim.keymap.set('n', '<C-l>', '<C-w>l', options_noremap)
    vim.keymap.set('n', '<C-h>', '<C-w>h', options_noremap)
    vim.keymap.set('n', '<C-j>', '<C-w>j', options_noremap)
    vim.keymap.set('n', '<C-k>', '<C-w>k', options_noremap)

    -- Telescope
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>',
                   options_remap)
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>',
                   options_remap)

    -- Floaterm
    vim.keymap.set('n', '<leader>tt', '<cmd>FloatermNew<CR>', options_remap)

    -- Lsp Stuff --
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
end

set_vim_g()
set_vim_o()
set_vim_wo()
set_vim_keymaps()
