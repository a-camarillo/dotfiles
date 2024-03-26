{
  pkgs,
  config,
  nix-colors,
  ...
}: {
  imports = [
    nix-colors.homeManagerModule
    ../colorScheme.nix
  ];

  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";

      modules-left = [
        "sway/workspaces"
        "sway/mode"
      ];

      modules-right = [
        "tray"
        "network"
        "memory"
        "battery"
        "clock"
      ];

      network.format-wifi = "  {signalStrength}% {essid}";
      network.format-ethernet = "{icon}";
      network.format-icons.wifi = "";
      network.on-click = "kitty -e nmtui";

      memory.interval = 30;
      memory.format = "{icon} {}%";
      memory.format-icons = "󰍛";

      battery.format-discharging = "{icon} {capacity}%";
      battery.format-charging = "󰢝 {capacity}%";
      battery.format-plugged = "󰂅 {capacity}%";
      battery.format-icons = [
        "󰁺"
        "󰁻"
        "󰁼"
        "󰁽"
        "󰁾"
        "󰁿"
        "󰂀"
        "󰂁"
        "󰂁"
        "󰂂"
        "󰁹"
      ];

      battery.interval = 5;
      battery.states.warning = 40;
      battery.states.critical = 30;

      clock.format = "󰥔 {:%H:%M}";
    };
  };

  programs.waybar.style = let
    inherit (builtins) attrNames attrValues map readFile replaceStrings;
    baseNames = attrNames config.colorscheme.palette;
    baseValues = attrValues config.colorscheme.palette;
    baseRGB = map (nix-colors.lib-core.conversions.hexToRGBString ", ") baseValues;
    style = readFile ./style.css;
  in
    replaceStrings baseNames baseRGB style;
}
