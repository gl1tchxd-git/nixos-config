{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    dash-to-dock
    unite
  ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
}
