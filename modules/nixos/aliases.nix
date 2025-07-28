{
  programs.bash = {
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos;";
      nrt = "sudo nixos-rebuild test --flake ~/nixos;";
    };
  };
}