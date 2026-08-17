{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Communication
    unstable.vesktop
    unstable.teams-for-linux
    arrpc
    element-desktop
    thunderbird

    # Media & Entertainment
    spotify
    losslesscut-bin
    ani-cli
    calibre
  ];
}
