{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    nbfc-linux
  ];
}