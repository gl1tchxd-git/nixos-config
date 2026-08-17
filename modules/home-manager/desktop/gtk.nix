{
  config,
  pkgs,
  lib,
  ...
}:

let
  catppuccinDark = pkgs.catppuccin-gtk.override {
    accents = [ "mauve" ];
    size = "compact";
    tweaks = [
      "rimless"
      "black"
    ];
    variant = "mocha";
  };
  catppuccinLight = pkgs.catppuccin-gtk.override {
    accents = [ "mauve" ];
    size = "compact";
    tweaks = [
      "rimless"
      "black"
    ];
    variant = "latte";
  };
  # Correct name format: Catppuccin-{Variant}-{Size}-{Accent}-{Dark|Light}
  darkThemeName = "catppuccin-mocha-mauve-compact+rimless,black";
  lightThemeName = "catppuccin-latte-mauve-compact+rimless,black";
in
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.packages = with pkgs; [
    catppuccin
    magnetic-catppuccin-gtk
    catppuccin-cursors
  ];

  fonts.fontconfig.enable = true;
}
