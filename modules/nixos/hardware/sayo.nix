{ pkgs, lib, ... }: {
  services.udev.packages = [ 
    pkgs.openocd
  ];

  services.udev.extraRules = builtins.concatStringsSep "\n" [
    (builtins.readFile ../../../udev/70-sayo.rules)
  ];
}