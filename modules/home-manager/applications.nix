{ config, pkgs, inputs, unstable, ... }:

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
    
    # Office & Productivity
    masterpdfeditor4
    libreoffice-still
    xournalpp
    rnote
    
    # Creative & Design
    kicad
    eagle
    aseprite
    freecad-wayland
    blender
    
    # Development IDEs
    jetbrains-toolbox
    vscodium
    
    # File Management
    kdePackages.dolphin
    bottles
    
    # System Tools
    gparted
    protonvpn-gui
    remmina
    
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
  ];
}