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
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "Intel";
    DRI_PRIME = "0";
  };

  services.xserver.videoDrivers = [ "intel" ];
}
