{pkgs, ...}: let
  mod = "Mod4";
in {
  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.package = pkgs.i3-gaps;
  xsession.windowManager.i3.config.modifier = mod;
  xsession.windowManager.i3.config.terminal = "${pkgs.kitty}/bin/kitty";
  xsession.windowManager.i3.config.bars = [
    {
      position = "bottom";
      statusCommand = "${pkgs.i3status}/bin/i3status";
    }
  ];
  xsession.windowManager.i3.config.gaps = {
    inner = 5;
    outer = 5;
  };
  xsession.windowManager.i3.config.keybindings = {
    "${mod}+Return" = "exec ${pkgs.kitty}/bin/kitty";
    "${mod}+Shift+q" = "kill";

    "${mod}+h" = "focus left";
    "${mod}+j" = "focus down";
    "${mod}+k" = "focus up";
    "${mod}+l" = "focus right";

    "${mod}+Shift+c" = "reload";
    "${mod}+Shift+r" = "restart";

    "${mod}+1" = "workspace number 1";
    "${mod}+2" = "workspace number 2";
    "${mod}+3" = "workspace number 3";
    "${mod}+4" = "workspace number 4";
    "${mod}+5" = "workspace number 5";
    "${mod}+6" = "workspace number 6";
    "${mod}+7" = "workspace number 7";
    "${mod}+8" = "workspace number 8";
    "${mod}+9" = "workspace number 9";
    "${mod}+10" = "workspace number 10";

    "${mod}+Shift+1" = "move container to workspace number 1";
    "${mod}+Shift+2" = "move container to workspace number 2";
    "${mod}+Shift+3" = "move container to workspace number 3";
    "${mod}+Shift+4" = "move container to workspace number 4";
    "${mod}+Shift+5" = "move container to workspace number 5";
    "${mod}+Shift+6" = "move container to workspace number 6";
    "${mod}+Shift+7" = "move container to workspace number 7";
    "${mod}+Shift+8" = "move container to workspace number 8";
    "${mod}+Shift+9" = "move container to workspace number 9";
    "${mod}+Shift+10" = "move container to workspace number 10";

    "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show run";
  };
  
  services.autorandr.enable = true;
  programs.autorandr.enable = true;
  programs.autorandr.profiles = {
    default = {
      config = {
        "Virtual1" = {
          enable = true;
          dpi = 96;
          mode = "1920x1080";
          primary = true;
          rate = "59.96";
        };
      };
      fingerprint = {
        "Virtual1" = "--CONNECTED-BUT-EDID-UNAVAILABLE--Virtual1"; 
      };
    };
  };
  home.file."background-image".source = ../gobirds.png;
}
