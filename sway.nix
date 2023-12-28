{pkgs, ...}: {
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.wrapperFeatures.gtk = true;
  wayland.sway.config.modifier = "Mod4";
  wayland.sway.config.terminal = "${pkgs.alacritty}/bin/alacritty";
}
