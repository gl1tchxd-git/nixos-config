# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, unstable, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
   #  ../../modules/nixos/cosmic.nix
   #  ../../modules/nixos/spicetify.nix
   #  ../../modules/nixos/hanabi.nix
      ../../modules/nixos/gnome.nix
      ../../modules/nixos/aliases.nix
      ../../modules/nixos/plymouth.nix
    ];

  # Bootloader.
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

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  virtualisation.docker.enable = true;

  networking.hostName = "laptop-felix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.tailscale.enable = true;

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  systemd.services.ModemManager.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

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


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint ];

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.fprintd.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.felix = {
    isNormalUser = true;
    description = "Felix Buchsteiner";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "dialout" "docker" ];
    # User packages moved to home-manager modules
  };

  hardware.opentabletdriver.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    SDL
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    SDL_image
    SDL_mixer
    SDL_ttf
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    bzip2
    cairo
    cups
    curlWithGnuTls
    dbus
    dbus-glib
    desktop-file-utils
    e2fsprogs
    expat
    flac
    fontconfig
    freeglut
    freetype
    fribidi
    fuse
    fuse3
    gdk-pixbuf
    glew110
    glib
    gmp
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-ugly
    gst_all_1.gstreamer
    gtk2
    harfbuzz
    icu
    keyutils.lib
    libGL
    libGLU
    libappindicator-gtk2
    libcaca
    libcanberra
    libcap
    libclang.lib
    libdbusmenu
    libdrm
    libgcrypt
    libgpg-error
    libidn
    libjack2
    libjpeg
    libmikmod
    libogg
    libpng12
    libpulseaudio
    librsvg
    libsamplerate
    libthai
    libtheora
    libtiff
    libudev0-shim
    libusb1
    libuuid
    libvdpau
    libvorbis
    libvpx
    libxcrypt-legacy
    libxkbcommon
    libxml2
    mesa
    nspr
    nss
    openssl
    p11-kit
    pango
    pixman
    python3
    speex
    stdenv.cc.cc
    tbb
    udev
    vulkan-loader
    wayland
    xorg.libICE
    xorg.libSM
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXft
    xorg.libXi
    xorg.libXinerama
    xorg.libXmu
    xorg.libXrandr
    xorg.libXrender
    xorg.libXt
    xorg.libXtst
    xorg.libXxf86vm
    xorg.libpciaccess
    xorg.libxcb
    xorg.xcbutil
    xorg.xcbutilimage
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
    xorg.xcbutilwm
    xorg.xkeyboardconfig
    xz
    zlib
  ];

  services.onedrive.enable = true;

  # System-wide packages that should remain at system level
  environment.systemPackages = with pkgs; [
    # System administration tools
    wget
    cifs-utils
    mokutil
    
    # Virtualization & Containers
    gnome-boxes
    virt-manager
    bottles
    lutris
    inputs.winapps.packages."${system}".winapps
    inputs.winapps.packages."${system}".winapps-launcher
  ];

  environment.sessionVariables = {
    WINEDLLOVERRIDES = "comdlg32=n,b";
  };

  services.udev.packages = [ 
    pkgs.platformio-core
    pkgs.openocd
  ];

  services.udev.extraRules = builtins.concatStringsSep "\n" [
    (builtins.readFile ../../udev/99-platformio.rules)
    (builtins.readFile ../../udev/70-sayo.rules)
  ];
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}