{ config, pkgs, lib, ... }:

let
  fusionPrefix = "${config.home.homeDirectory}/.fusion360-wine";

  # Wine stable
  winePkg = pkgs.wineWowPackages.stable;

  # Installer dependencies
  installerDeps = with pkgs; [
    gettext
    wget
    cabextract
    p7zip
    unzip
    zenity
    xorg.xrandr
    bc
    bash
    pkgs.winetricks
  ];

  # Helper script that sets up Wine prefix and runs installer
  setupScript = pkgs.writeShellScriptBin "setup-fusion360" ''
    #!/usr/bin/env bash
    set -euo pipefail

    export WINEPREFIX="${fusionPrefix}"
    export WINEARCH=win64
    export PATH="${winePkg}/bin:${pkgs.winetricks}/bin:$PATH"

    mkdir -p "$WINEPREFIX"

    echo "Initializing Wine prefix..."
    WINEDLLOVERRIDES="winemenubuilder.exe=d" wineboot --init

    echo "Installing Winetricks dependencies..."
    winetricks -q corefonts comctl32 vcrun2017 dxvk

    TMPDIR=$(mktemp -d)
    cd "$TMPDIR"
    echo "Downloading Fusion 360 installer..."
    wget -O install.sh https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/setup/autodesk_fusion_installer_x86-64.sh
    chmod +x install.sh

    echo "Running Fusion 360 installer..."
    ./install.sh --install --default

    echo "Cleaning up..."
    rm -rf "$TMPDIR"

    echo "Fusion 360 setup finished. You can now run 'fusion360'."
  '';

  # Launcher script
  launcherScript = pkgs.writeShellScriptBin "fusion360" ''
    #!/usr/bin/env bash
    export WINEPREFIX="${fusionPrefix}"
    export WINEARCH=win64
    export PATH="${winePkg}/bin:$PATH"

    if [ ! -f "${fusionPrefix}/drive_c/Program Files/Autodesk/webdeploy/production/Fusion360.exe" ]; then
      echo "Fusion360.exe not found!"
      echo "Please run the installer first:"
      echo "  setup-fusion360"
      exit 1
    fi

    "${winePkg}/bin/wine" "${fusionPrefix}/drive_c/Program Files/Autodesk/webdeploy/production/Fusion360.exe" "$@"
  '';
in
{
  # Merge everything into a single home.packages list
  home.packages = installerDeps ++ [ winePkg setupScript launcherScript ];
}
