{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.desktopManager.gnome.enable = true;
}
