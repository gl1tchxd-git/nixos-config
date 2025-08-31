{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development tools
    vim
    git
    gcc
    rustup
    bison
    gnumake
    python3
    meson
    jre21_minimal
    
    # Hardware development
    platformio
    arduino-ide
    teensy-loader-cli
    rpi-imager
    
    # System utilities for development
    usbutils
    libusb1
    hidapi
    keyutils
  ];

  programs.git = {
    enable = true;
    # Add your git configuration here if needed
    # userName = "Felix Buchsteiner";
    # userEmail = "your.email@example.com";
  };

  # Development environment variables
  home.sessionVariables = {
    # Add any development-specific environment variables here
  };
}