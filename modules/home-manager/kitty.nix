{ config, pkgs, inputs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      hide_window_decorations = "yes";
      shell_integration = "enabled";
      confirm_os_window_close = -1;
    };

    settings = {
      window_padding_width = 10;
      font_family = "JetBrains Mono";
      font_size = 12.0;
    };
  };

  xdg.configFile = {
    "kitty/dark-theme.auto.conf".text = builtins.readFile ../../data/themes/kitty-dark.conf;
    
    "kitty/no-preference-theme.auto.conf".text = builtins.readFile ../../data/themes/kitty-light.conf;
    
    "kitty/light-theme.auto.conf".text = builtins.readFile ../../data/themes/kitty-light.conf;
  };
}
