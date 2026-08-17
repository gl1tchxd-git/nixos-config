{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.shellAliases = {
    # NixOS rebuild aliases
    nrs = "sudo nixos-rebuild switch --flake /home/felix/nixos";
    nrt = "sudo nixos-rebuild test --flake /home/felix/nixos";
    nfu = "nix flake update";
    ngc = "sudo nix-collect-garbage -d";

    # Navigation
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    # Safety aliases
    "rm" = "rm -i";
    "cp" = "cp -i";
    "mv" = "mv -i";

    # Quick edits
    "hm" = "home-manager";
    "hms" = "home-manager switch";
  };
}
