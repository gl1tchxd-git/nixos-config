{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    xorg.libXrandr
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXxf86vm
    libGL
    glfw
    wayland
    libxkbcommon
    libGL
    glfw-wayland
  ];
}
