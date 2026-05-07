{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    # Browsers
    firefox
    google-chrome
    inputs.zen-browser.packages."${pkgs.system}".twilight

    # Communication
    vesktop
    unstable.teams-for-linux
    arrpc
    thunderbird

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
    unstable.kicad
    # master.kicad-unstable
    # eagle
    aseprite
    freecad-wayland
    unstable.blender
    drawio
    krita
    gimp
    prusa-slicer

    # System Tools
    gparted
    remmina
    freerdp
    unstable.cisco-packet-tracer_9
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
    unstable.satisfactorymodmanager
    octaveFull
    mesa-demos
    xorg.xprop
    unstable.digital
    unstable.mathematica
    qalculate-gtk
  ];
}
