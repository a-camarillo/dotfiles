{
  config,
  fonts,
  pkgs,
  ...
}: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # direnv
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "anthony";
  home.homeDirectory = "/home/anthony";

  imports = [
    ./bash.nix
    ./git.nix
    ./kitty.nix
    ./neovim.nix
    ./sway/sway.nix
    ./sway/waybar.nix
    ./i3/i3.nix
  ];
  # The home.packages option allows you to install Nix packages into your
  # environment.
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    poetry
    neofetch

    lazygit
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set-option -g prefix C-a
      set -g default-terminal "tmux"
      set -sg escape-time 0

      set -g base-index 1
      setw -g pane-base-index 1
      set-option -g focus-events on
      set-option -g history-limit 4000
    '';
  };

  programs.tmate = {
    enable = true;
    extraConfig = ''
      set -g default-terminal "tmate"
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/anthony/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
