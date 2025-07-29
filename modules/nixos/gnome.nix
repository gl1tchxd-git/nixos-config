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
    night-theme-switcher
  ] ++ (with pkgs.myPackages.gnomeCursors; [
    hoshimi-miyabi
    breezeX
  ]);

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.variables = {
    XCURSOR_THEME = "Hoshimi-miyami";
    XCURSOR_SIZE = "24";

    # GTK_THEME = "Catppuccin-gtk";
  };

  # programs.dconf.enable = true;
  
  # environment.etc."dconf/db/local.d/01-theme".text = ''
  #   [org/gnome/desktop/interface]
  #   gtk-theme='catppuccin-gtk'
  #   icon-theme='catppuccin-gtk'
  #   cursor-theme='Hoshimi-miyabi'
  # '';
}
