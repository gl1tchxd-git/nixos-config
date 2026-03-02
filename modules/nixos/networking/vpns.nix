{ config, pkgs, inputs, ... }:

{
  services.openvpn.servers = {
    Slovenia = {
        config = ''
          config /home/felix/nixos/data/config/Slovenia.conf
          auth-user-pass /home/felix/nixos/data/config/.creds
        '';
      autoStart = false;
    };
    US = {
      config = ''
        config /home/felix/nixos/data/config/US.conf
        auth-user-pass /home/felix/nixos/data/config/.creds
      '';
      autoStart = false;
    };
    Austria = {
      config = ''
        config /home/felix/nixos/data/config/Austria.conf
        auth-user-pass /home/felix/nixos/data/config/.creds
      '';
      autoStart = true;
    };
  };
}