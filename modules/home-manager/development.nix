{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development tools
    vim
    git

    # Hardware development
    platformio
    arduino-ide
    teensy-loader-cli
    rpi-imager
    hterm
    pulseview
    sigrok-cli

    # System utilities for development
    usbutils
    libusb1
    hidapi
    keyutils

    # IDEs
    # jetbrains-toolbox
    unstable.jetbrains.idea
    jetbrains.rust-rover
    jetbrains.clion
    jetbrains.pycharm
    unstable.jetbrains.rider
    # vscodium
    unstable.vscode
    unstable.zed-editor
  ];

  programs.git = {
    enable = true;
    # Add your git configuration here if needed
    # userName = "Felix Buchsteiner";
    # userEmail = "contact@gl1tchxd.at";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--style=full"
      "--layout=reverse" # prompt at top
    ];
  };

  # Development environment variables
  home.sessionVariables = {
    # Add any development-specific environment variables here
  };

  xdg.desktopEntries.nixos-config = {
    name = "NixOS Config";
    comment = "Open NixOS configuration in Zed";
    exec = "zeditor /home/felix/nixos";
    icon = "/home/felix/nixos/data/icons/zed-nixos.png";

    terminal = false;
    categories = [ "Development" ];
  };
}
