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
    unstable.gnome-frog

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
    unstable.satisfactorymodmanager
    octaveFull
    mesa-demos
    xorg.xprop
    unstable.digital
    #unstable.mathematica
    qalculate-gtk
  ];
}
