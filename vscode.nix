{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    userSettings = {
      editor = {
        fontFamily = "JetBrainsMono";
      };
      workbench = {
        colorTheme = "Solarized Dark";
      };
    };
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      ms-toolsai.jupyter
      yzhang.markdown-all-in-one
    ];
  };
}
