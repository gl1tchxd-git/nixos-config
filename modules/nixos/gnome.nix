{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    dash-to-dock
    unite
    arcmenu
    blur-my-shell
    forge
    just-perfection
    open-bar
    system-monitor
  ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
}
