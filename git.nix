{...}: {
  programs.git = {
    enable = true;
    userName = "Anthony Camarillo";
    userEmail = "anthony.camarillo.96@gmail.com";
    extraConfig.core.editor = "nvim";
    extraConfig.init.defaultBranch = "main";
  };
}
