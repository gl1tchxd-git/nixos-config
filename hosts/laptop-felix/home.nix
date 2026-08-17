{
  config,
  pkgs,
  unstable,
  ...
}:

{
  imports = [
    ../../modules/home-manager/shell
    ../../modules/home-manager/desktop
    ../../modules/home-manager/terminal
    ../../modules/home-manager/development
    ../../modules/home-manager/applications
    ../../modules/home-manager/fonts
  ];

  home.username = "felix";
  home.homeDirectory = "/home/felix";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
