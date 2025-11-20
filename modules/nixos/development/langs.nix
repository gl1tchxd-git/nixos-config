{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    openjdk24
    gcc
    rustup
    bison
    gnumake
    python3
    micromamba
    meson
  ];
}