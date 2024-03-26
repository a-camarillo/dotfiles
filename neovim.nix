{
  pkgs,
  lib,
  ...
}: {
  programs.neovim = let
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # lsp
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./pozole/lsp.lua;
      }

      # completion
      {
        plugin = nvim-cmp;
        config = toLuaFile ./pozole/cmp.lua;
      }

      # telescope
      {
        plugin = telescope-nvim;
        config = toLuaFile ./pozole/telescope.lua;
      }

      {
        plugin = kanagawa-nvim;
        config = toLuaFile ./pozole/theme.lua;
      }

      {
        plugin = vim-floaterm;
        config = toLuaFile ./pozole/floaterm.lua;
      }

      nvim-treesitter.withAllGrammars
      lualine-nvim

      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      which-key-nvim
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

      ripgrep
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./pozole/vim.lua};
    '';
  };
}
