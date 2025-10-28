{ pkgs, lib, ... }: {
  services.udev.packages = [ 
    pkgs.platformio-core
  ];

  services.udev.extraRules = builtins.concatStringsSep "\n" [
    (builtins.readFile ../../../udev/99-platformio.rules)
  ];
}