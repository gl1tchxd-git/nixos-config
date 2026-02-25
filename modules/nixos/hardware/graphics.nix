{ pkgs, lib, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      intel-media-driver
      intel-compute-runtime
    ];
  };

  
  services.xserver.videoDrivers = [ "intel" ];
}