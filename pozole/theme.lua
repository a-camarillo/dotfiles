local kanagawa = require 'kanagawa'
local lualine = require 'lualine'

lualine.setup {}

kanagawa.setup {theme = "dragon"}

vim.cmd([[colorscheme kanagawa-dragon]])
