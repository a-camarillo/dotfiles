{pkgs, ...}: {
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.wrapperFeatures.gtk = true;
  wayland.windowManager.sway.config.modifier = "Mod4";
  wayland.windowManager.sway.config.terminal = "${pkgs.alacritty}/bin/alacritty";

  wayland.windowManager.sway.config.output = {
    "BOE 0x095F Unknown" = {
      mode = "1920x1080@60Hz";
      scale = "1.00";
    };
  };
}
