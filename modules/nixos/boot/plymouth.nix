{ pkgs, lib, ... }: {
	boot = {

    plymouth = {
      enable = true;
      theme = "blahaj";
      themePackages = with pkgs; [
        plymouth-blahaj-theme
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "loglevel=0"
      "splash"
      "plymouth.nolog"
      "plymouth.force-delay=3"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 3;
  };

  systemd.services.plymouth-quit = {
    serviceConfig = {
      ExecStartPre = lib.mkBefore "${pkgs.coreutils}/bin/sleep 5";
    };
  };
}