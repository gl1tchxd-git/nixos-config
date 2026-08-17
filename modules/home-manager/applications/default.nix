{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./browsers.nix
    ./media.nix
    ./gaming.nix
    ./productivity.nix
    ./creative.nix
  ];

  home.packages = with pkgs; [
    # System Tools
    gparted
    remmina
    freerdp
    moonlight-qt
    #unstable.cisco-packet-tracer_9
    wireshark

    # Terminal & CLI Tools
    unstable.warp-terminal
    btop
    nethogs
    fastfetch
    screenfetch
    pfetch
    hyfetch
    cbonsai
    pipes

    # Utilities
    # geogebra6
    octaveFull
    mesa-demos
    xorg.xprop
    unstable.digital
    #unstable.mathematica
    qalculate-gtk
  ];
}
