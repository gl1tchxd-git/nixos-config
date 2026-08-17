{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    # Browsers
    firefox
    google-chrome
    inputs.zen-browser.packages."${pkgs.system}".twilight
  ];
}
