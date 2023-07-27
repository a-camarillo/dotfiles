return {
	{
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
	config = function()
	-- load the colorscheme here
	vim.cmd([[colorscheme tokyonight]])
	end
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = { theme = 'tokyonight' },
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', mode = 'n', desc = 'Telescope find files' },
		},
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		opts = {
			servers = {
				lua_ls = {},
				gopls = {},
			},
			setup = {},
		},
		config = function(_, opts)
			require('mason').setup(opts)
			require('mason-lspconfig')
			require 'configs.lspconfig'
		end
	},
	{
		'williamboman/mason.nvim',
		cmd = "Mason",
    	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ':MasonUpdate',
		dependencies = {
			{
				'williamboman/mason-lspconfig.nvim',
				ensure_installed = {
					'lua_ls',
					'gopls',
					'pyright',
				},
			},
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
	},
}
