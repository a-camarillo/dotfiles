{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.wrapperFeatures.gtk = true;
  wayland.windowManager.sway.config.modifier = "Mod4";
  wayland.windowManager.sway.config.terminal = "${pkgs.kitty}/bin/kitty";
  wayland.windowManager.sway.config.bars = [{command = "${config.programs.waybar.package}/bin/waybar";}];

  # gaps
  wayland.windowManager.sway.config.gaps.smartGaps = true;
  wayland.windowManager.sway.config.gaps.inner = 5;
  wayland.windowManager.sway.config.gaps.outer = 5;

  #laptop output
  wayland.windowManager.sway.config.output = {
    Virtual-1 = {
      mode = "1920x1440@60Hz";
      background = "~/dotfiles/gobirds.png fill";
    };
    eDP-1 = {
      background = "~/dotfiles/gobirds.png fill";
    };
  };
}
