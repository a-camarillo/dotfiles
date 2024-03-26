local telescope = require 'telescope'

telescope.setup {defaults = {file_ignore_patterns = {"node_modules/.*"}}}

local options = {noremap = true, silent = true}

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
