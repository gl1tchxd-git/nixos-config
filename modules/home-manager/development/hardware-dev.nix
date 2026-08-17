{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Hardware development
    platformio
    arduino-ide
    teensy-loader-cli
    rpi-imager
    hterm
    unstable.pulseview
    sigrok-cli

    # System utilities for development
    usbutils
    libusb1
    hidapi
    keyutils
  ];
}
