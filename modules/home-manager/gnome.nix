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
  ] ++ ( with pkgs.gnomeExtensions; [
    dash-to-dock
    unite
    blur-my-shell
    paperwm
    system-monitor
    night-theme-switcher
    user-themes
  ]) ++ ( with pkgs.myPackages.gnomeCursors; [
    hoshimi-miyabi
  ]);

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
      name = "Hoshimi-miyabi";
      size = 24;
    };
  };

  # Configure fonts
  fonts.fontconfig.enable = true;
  
  home.pointerCursor = {
    name = "Hoshimi-miyabi";
    package = pkgs.myPackages.gnomeCursors.hoshimi-miyabi;
    size = 24;  # or your preferred size
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Hoshimi-miyabi";
    XCURSOR_SIZE = "24";
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "extension-list@tu.berry"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "nightthemeswitcher@romainvigier.fr"
        "paperwm@paperwm.github.com"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "unite@hardpixel.eu"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    
    "org/gnome/desktop/interface" = {
      cursor-theme = "Hoshimi-miyabi";
      cursor-size = 24;
    };
  };
}