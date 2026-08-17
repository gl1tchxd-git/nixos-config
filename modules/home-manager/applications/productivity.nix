{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Office & Productivity
    masterpdfeditor4
    libreoffice-still
    xournalpp
    rnote
    unstable.gnome-frog
  ];
}
