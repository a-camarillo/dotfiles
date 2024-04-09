local kanagawa = require 'kanagawa'
local lualine = require 'lualine'

lualine.setup {}

kanagawa.setup {theme = "dragon"}

local function VibeCheck()
    if tonumber(os.date("%H")) > 7 and tonumber(os.date("%H")) < 18 then
        vim.cmd([[colorscheme kanagawa-lotus]])
    else
        vim.cmd([[colorscheme kanagawa-dragon]])
    end
end

VibeCheck()
