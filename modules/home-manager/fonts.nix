{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    corefonts
    vista-fonts
  ];
}