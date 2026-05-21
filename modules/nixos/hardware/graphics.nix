{ pkgs, lib, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      intel-media-driver
      intel-compute-runtime
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.xserver.videoDrivers = [ "intel" ];
}
