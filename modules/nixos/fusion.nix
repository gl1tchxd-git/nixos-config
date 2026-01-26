{ config, pkgs, ... }:

let
  fusion-env = pkgs.buildFHSUserEnv {
    name = "fusion360-env";
    targetPkgs = pkgs: (with pkgs; [
      # -- Core Utilities --
      coreutils
      curl
      wget
      file
      gawk
      gnused
      gnugrep
      findutils
      p7zip
      cabextract
      zenity
      
      # -- Missing Dependencies Fixed --
      gettext       # Fixes "gettext: command not found"
      bc            # Calculator tool needed by scripts
      samba         # Provides 'wbinfo'
      lsb-release   # Provides 'lsb_release' command
      xorg.xrandr   # Display configuration tool
      
      # -- Wine & Graphics --
      wineWowPackages.staging
      winetricks
      vulkan-loader
      vulkan-tools
      mesa
      intel-media-driver
      libva
      libglvnd
      
      # -- System Libs --
      udev
      dbus
      fontconfig
      freetype
      xorg.libX11
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      libxkbcommon
    ]);
    runScript = "bash";
  };
in
{
  environment.systemPackages = [ fusion-env ];
}
