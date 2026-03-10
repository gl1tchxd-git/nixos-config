{ pkgs, lib, ... }:
{
  networking.networkmanager.enable = true;
  systemd.services.ModemManager.enable = false;

  services.avahi.enable = true;
}
