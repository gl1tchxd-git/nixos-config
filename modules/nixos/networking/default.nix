{ pkgs, lib, ... }: {
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  systemd.services.ModemManager.enable = false;

  services.avahi.enable = true;
}