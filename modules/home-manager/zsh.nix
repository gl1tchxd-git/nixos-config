{ config, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        ll = "ls -l";
        
        nrs = "sudo nixos-rebuild switch --flake ~/nixos;";
        nrt = "sudo nixos-rebuild test --flake ~/nixos;";

        amend = "git commit --amend --no-edit;";
    };
    history.size = 10000;
    };
}
