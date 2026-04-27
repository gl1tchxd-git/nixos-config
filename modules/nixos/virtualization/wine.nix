{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # bottles
    lutris
    inputs.winapps.packages."${system}".winapps
    inputs.winapps.packages."${system}".winapps-launcher
  ];

  environment.sessionVariables = {
    WINEDLLOVERRIDES = "comdlg32=n,b";
  };
}
