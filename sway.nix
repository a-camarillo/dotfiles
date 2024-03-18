{pkgs, ...}: {
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.wrapperFeatures.gtk = true;
  wayland.windowManager.sway.config.modifier = "Mod4";
  wayland.windowManager.sway.config.terminal = "${pkgs.kitty}/bin/kitty";
  wayland.windowManager.sway.config.bars = "${pkgs.waybar}/bin/waybar";
  
  # gaps
  wayland.windowManager.sway.config.gaps.smartGaps = true;
  wayland.windowManager.sway.config.gaps.inner = 5;
  wayland.windowManager.sway.config.gaps.outer = 5;

}
