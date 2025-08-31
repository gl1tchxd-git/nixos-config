{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Catppuccin theme components
    catppuccin
    magnetic-catppuccin-gtk
    catppuccin-cursors
    
    # Fonts
    jetbrains-mono
    
    # GNOME customization
    gnome-tweaks
    gdm-settings
  ];

  # GTK theming configuration
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };
    
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Hoshimi-Miyabi";
      size = 24;
    };
  };

  # Configure fonts
  fonts.fontconfig.enable = true;
  
  home.pointerCursor = {
    name = "Hoshimi-Miyabi";
    package = pkgs.myPackages.gnomeCursors.hoshimi-miyabi;
    size = 24;  # or your preferred size
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Hoshimi-Miyabi";
    XCURSOR_SIZE = "24";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Hoshimi-Miyabi";
      cursor-size = 24;
  };
};
}