{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNerdFont";
      size = 14.0;
    };
    theme = "kanagawabones";
    settings = {
      background_opacity = "0.9";
    };
  };
}
