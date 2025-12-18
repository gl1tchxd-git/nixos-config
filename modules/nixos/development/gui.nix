{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    freetype
    fontconfig
    xorg.libXrender
    xorg.libXinerama
    xorg.libXext
    xorg.libXrandr
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXxf86vm
    libGL
    glfw
    wayland
    libxkbcommon
    glfw-wayland
  ];

  environment.variables = {
    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
      pkgs.freetype
      pkgs.fontconfig
      pkgs.xorg.libXrender
      pkgs.xorg.libXinerama
      pkgs.xorg.libXext
      pkgs.xorg.libXrandr
      pkgs.xorg.libX11
      pkgs.xorg.libXcursor
      pkgs.xorg.libXi
      pkgs.xorg.libXxf86vm
      pkgs.libGL
      pkgs.glfw
      pkgs.wayland
      pkgs.libxkbcommon
      pkgs.glfw-wayland
    ]}";
  };
}