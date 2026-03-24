{ pkgs, lib, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
  ];
  services.udev.packages = with pkgs; [
    platformio-core
    libsigrok
  ];
  environment.systemPackages = with pkgs; [
    avrdude
    avra
    simavr
    fxload
    # avr-gdb
  ];
  services.udev.extraRules = builtins.concatStringsSep "\n" [
    (builtins.readFile ../../../udev/99-platformio.rules)
    (builtins.readFile ../../../udev/z010_mchp_tools.rules)
    (builtins.readFile ../../../udev/z012_mchp_efr.rules)
  ];
}
