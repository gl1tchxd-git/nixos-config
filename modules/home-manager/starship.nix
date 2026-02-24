{ config, pkgs, inputs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    } // builtins.fromTOML (builtins.readFile ../../data/themes/catppuccin-powerline.toml);
  };
}