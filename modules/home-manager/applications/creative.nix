{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Creative & Design
    (unstable.kicad.override { with3d = true; })
    # master.kicad-unstable
    # eagle
    aseprite
    freecad-wayland
    unstable.blender
    drawio
    krita
    gimp
    prusa-slicer
    bambu-studio
  ];
}
