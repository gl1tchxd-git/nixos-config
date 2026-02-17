{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    # System administration tools
    wget
    cifs-utils
    mokutil
    appimage-run
    direnv
  ];
}