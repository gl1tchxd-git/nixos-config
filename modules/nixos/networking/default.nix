{ pkgs, lib, ... }: {
  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  systemd.services.ModemManager.enable = false;
}