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
    dotnet-sdk_9
    unstable.avalonia
  ];
}