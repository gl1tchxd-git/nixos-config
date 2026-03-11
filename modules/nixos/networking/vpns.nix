{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ "/home/felix/nixos/data/config/.wg-env" ];
    profiles = {
      "Slovenia" = {
        connection = {
          id = "Slovenia";
          type = "wireguard";
          interface-name = "wg-slovenia";
          autoconnect = "false";
        };
        wireguard = {
          private-key = "$WG_PRIVATE_KEY";
        };
        "wireguard-peer.yPdmxOfzm06fotkt/dlaAiyxWPaWfCuDPaUljNx+c38=" = {
          endpoint = "si-lju.prod.surfshark.com:51820";
          allowed-ips = "0.0.0.0/0;";
        };
        ipv4 = {
          method = "manual";
          address1 = "10.14.0.2/16";
          dns = "162.252.172.57;149.154.159.92;";
        };
        ipv6 = {
          method = "disabled";
        };
      };

      "US" = {
        connection = {
          id = "US";
          type = "wireguard";
          interface-name = "wg-us";
          autoconnect = "false";
        };
        wireguard = {
          private-key = "$WG_PRIVATE_KEY";
        };
        "wireguard-peer.1g84fGxVJokKXdMYEJKjN6/opyYN/YSHmrMyw0v6VnM=" = {
          endpoint = "us-hou.prod.surfshark.com:51820";
          allowed-ips = "0.0.0.0/0;";
        };
        ipv4 = {
          method = "manual";
          address1 = "10.14.0.2/16";
          dns = "162.252.172.57;149.154.159.92;";
        };
        ipv6 = {
          method = "disabled";
        };
      };

      "Austria" = {
        connection = {
          id = "Austria";
          type = "wireguard";
          interface-name = "wg-austria";
          autoconnect = "false";
        };
        wireguard = {
          private-key = "$WG_PRIVATE_KEY";
        };
        "wireguard-peer.dPZe8Jq3Hu0k07MDk+Y4+AS2XHSLYalyg91TSFXRYEA=" = {
          endpoint = "at-vie.prod.surfshark.com:51820";
          allowed-ips = "0.0.0.0/0;";
        };
        ipv4 = {
          method = "manual";
          address1 = "10.14.0.2/16";
          dns = "162.252.172.57;149.154.159.92;";
        };
        ipv6 = {
          method = "disabled";
        };
      };
    };
  };
}
