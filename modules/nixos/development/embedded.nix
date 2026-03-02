{ pkgs, lib, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
  ];
  services.udev.packages = [ 
    pkgs.platformio-core
  ];
  environment.systemPackages = with pkgs; [
    avrdude
  ];
  services.udev.extraRules = builtins.concatStringsSep "\n" [
    (builtins.readFile ../../../udev/99-platformio.rules)
    (builtins.readFile ../../../udev/z010_mchp_tools.rules)
    (builtins.readFile ../../../udev/z012_mchp_efr.rules)
  ];
}