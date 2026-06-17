{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  environment.shellAliases = {
    ll = "ls -l";

    nrs = "sudo nixos-rebuild switch --flake ~/nixos;";
    nrt = "sudo nixos-rebuild test --flake ~/nixos;";

    amend = "git commit --amend --no-edit;";

    wakepc = "ssh felix@server-felix \"wakeonlan 08:BF:B8:17:D8:33\"";
  };
}
