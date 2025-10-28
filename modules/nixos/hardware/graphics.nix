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

    # Enable VA-API acceleration for video
  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
    WAYLAND_DISPLAY = "wayland-0";
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}