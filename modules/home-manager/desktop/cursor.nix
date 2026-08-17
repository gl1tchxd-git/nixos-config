{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.pointerCursor = {
    name = "Hoshimi-miyabi";
    package = pkgs.myPackages.gnomeCursors.hoshimi-miyabi;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk.cursorTheme = {
    name = "Hoshimi-miyabi";
    size = 24;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Hoshimi-miyabi";
    XCURSOR_SIZE = "24";
  };

  home.packages = with pkgs; [
    myPackages.gnomeCursors.hoshimi-miyabi
  ];
}
