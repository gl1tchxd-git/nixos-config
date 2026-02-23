{ config, pkgs, inputs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      hide_window_decorations = "yes";
      shell_integration = "enabled";
      confirm_os_window_close = -1;
    };
  };
}
