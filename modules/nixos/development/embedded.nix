{ pkgs, lib, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
  ];
  services.udev.packages = [ 
    pkgs.platformio-core
  ];

  services.udev.extraRules = builtins.concatStringsSep "\n" [
    (builtins.readFile ../../../udev/99-platformio.rules)
  ];
}