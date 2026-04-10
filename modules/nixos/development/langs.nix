{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    openjdk25
    gcc
    rustup
    bison
    gnumake
    unstable.python3
    micromamba
    meson
    dotnet-sdk_9
    unstable.avalonia
    nil
    nixd
  ];
}
