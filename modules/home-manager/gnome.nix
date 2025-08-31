{ config, pkgs, ... }:

{
  # In your home-manager configuration
home.pointerCursor = {
  name = "Hoshimi-miyabi";
  package = pkgs.myPackages.gnomeCursors.hoshimi-miyabi;
  size = 24;  # or your preferred size
  gtk.enable = true;
  x11.enable = true;
};
  
  lib.mkForce gtk = {
    cursorTheme = {
      name = "Hoshimi-miyabi";
      size = 24;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Hoshimi-miyabi";
    XCURSOR_SIZE = "24";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Hoshimi-miyabi";
      cursor-size = 24;
  };
};
}