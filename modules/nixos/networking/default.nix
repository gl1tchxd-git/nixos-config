{ pkgs, lib, ... }: {
  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  systemd.services.ModemManager.enable = false;

  services.avahi.enable = true;

  # pritunl client for VPN connections

  systemd.services.pritunl-client = {
    enable = true;
    description = "Pritunl Client Service";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.pritunl-client}/bin/pritunl-client-service";
      Restart = "always";
    };
  };

  environment.systemPackages = with pkgs; [
    unstable.pritunl-client
  ];
}