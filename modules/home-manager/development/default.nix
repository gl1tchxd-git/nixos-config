{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./editors.nix
    ./git.nix
    ./hardware-dev.nix
  ];
}
