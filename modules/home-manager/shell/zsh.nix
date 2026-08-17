{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    initContent = lib.mkBefore ''
      autoload -Uz add-zsh-hook

      function __nl_after_first_prompt() {
        if [[ -z "''${__FIRST_PROMPT_DONE-}" ]]; then
          __FIRST_PROMPT_DONE=1
        else
          print
        fi
      }

      add-zsh-hook precmd __nl_after_first_prompt
    '';
  };
}
