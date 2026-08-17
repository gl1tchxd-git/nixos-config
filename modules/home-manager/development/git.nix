{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
    git
  ];

  programs.git = {
    enable = true;
    # Add your git configuration here if needed
    # userName = "Felix Buchsteiner";
    # userEmail = "contact@gl1tchxd.at";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--style=full"
      "--layout=reverse" # prompt at top
    ];
  };

  # Development environment variables
  home.sessionVariables = {
    # Add any development-specific environment variables here
  };
}
