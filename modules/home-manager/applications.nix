{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # Browsers
    firefox
    google-chrome
    inputs.zen-browser.packages."${pkgs.system}".twilight
    
    # Communication
    vesktop
    teams-for-linux
    arrpc
    thunderbird
    teamspeak6-client
    
    # Media & Entertainment
    spotify
    losslesscut-bin
    ani-cli
    
    # Gaming
    lunar-client
    osu-lazer-bin
    # steamtinkerlaunch
    furmark
    rpcs3
    prismlauncher
    
    # Office & Productivity
    masterpdfeditor4
    libreoffice-still
    xournalpp
    rnote
    
    # Creative & Design
    # kicad
    master.kicad-unstable
    eagle
    aseprite
    freecad-wayland
    unstable.blender
    drawio
    krita
    gimp
    
    # System Tools
    gparted
    remmina
    freerdp
    pkgs.myPackages.ciscoPacketTracer9
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
    fzf
    
    # Utilities
    # geogebra6
    unstable.satisfactorymodmanager
    octaveFull
    mesa-demos
    xorg.xprop
    unstable.digital
    unstable.mathematica
  ];
}