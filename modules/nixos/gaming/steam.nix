{ pkgs, lib, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    package = pkgs.steam.override {
      extraEnv = {
        GDK_BACKEND = "x11";
      };
    };
  };

  hardware.steam-hardware.enable = true;
}
