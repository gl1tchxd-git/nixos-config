{
  config,
  pkgs,
  lib,
  ...
}:
{
  networking.firewall.allowedTCPPorts = [ 3389 ];
}
