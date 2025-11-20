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
    
    # System utilities for development
    usbutils
    libusb1
    hidapi
    keyutils

    # IDEs 
    # jetbrains-toolbox
    unstable.jetbrains.idea-ultimate 
    jetbrains.rust-rover 
    jetbrains.clion 
    jetbrains.pycharm-professional 
    # vscodium 
    unstable.vscode
  ];

  programs.git = {
    enable = true;
    # Add your git configuration here if needed
    # userName = "Felix Buchsteiner";
    # userEmail = "contact@gl1tchxd.at";
  };

  # Development environment variables
  home.sessionVariables = {
    # Add any development-specific environment variables here
  };
}