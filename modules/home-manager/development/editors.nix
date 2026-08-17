{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # IDEs
    # jetbrains-toolbox
    #unstable.jetbrains.idea
    jetbrains.rust-rover
    jetbrains.clion
    jetbrains.pycharm
    #unstable.jetbrains.rider
    # vscodium
    unstable.vscode
    unstable.zed-editor

    unstable.opencode
  ];

  xdg.desktopEntries.nixos-config = {
    name = "NixOS Config";
    comment = "Open NixOS configuration in Zed";
    exec = "zeditor /home/felix/nixos";
    icon = "/home/felix/nixos/data/icons/zed-nixos.png";

    terminal = false;
    categories = [ "Development" ];
  };
}
