{pkgs, lib, ...}:
{
	programs.neovim = {
		enable = true;
		plugins = with pkgs; [
			vimPlugins.lazy-nvim
		
			# lsp
			vimPlugins.nvim-lspconfig
			vimPlugins.mason-nvim
			vimPlugins.mason-lspconfig-nvim

			vimPlugins.nvim-treesitter.withAllGrammars

			# completion
			vimPlugins.cmp-nvim-lsp
			vimPlugins.cmp-buffer
			vimPlugins.cmp-path
			vimPlugins.luasnip
			vimPlugins.cmp_luasnip

			# telescope
			vimPlugins.telescope-nvim
			vimPlugins.tokyonight-nvim 

			vimPlugins.lualine-nvim
			vimPlugins.vim-floaterm
		];

		extraPackages = with pkgs; [
			# language servers
			libclang
                        lua-language-server
			nodePackages."pyright"
			nodePackages."typescript-language-server"
                        nodePackages."@astrojs/language-server"
			gopls
			rust-analyzer
		];
	};

	home.file."/.config/nvim/" = {
		source = ./nvim;
		recursive = true;
	};
}
