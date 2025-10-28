{ pkgs, lib, ... }: {
  boot.loader = {
    grub = {
      enable = true;
      theme = pkgs.catppuccin-grub;
      # useOSProber = true;
      # copyKernels = true;
      efiSupport = true;
      devices = [ "nodev" ];
      extraEntries = ''
        menuentry "Reboot" { reboot }
        menuentry "Poweroff" { halt }
      '';
    };
    efi.canTouchEfiVariables = true;
  };
}