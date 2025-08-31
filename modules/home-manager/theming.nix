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
    
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
    
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Configure fonts
  fonts.fontconfig.enable = true;
  
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaMauve;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}