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

  services.gnome.gnome-remote-desktop.enable = true;
  systemd.services.gnome-remote-desktop = {
    wantedBy = [ "graphical.target" ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  environment.sessionVariables = {
    WAYLAND_DISPLAY = "wayland-0"; # usually set automatically
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_TYPE = "wayland";
  };
}
