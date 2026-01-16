{ pkgs, lib, ... }:

let
  pname = "ciscoPacketTracer9";
  version = "9.0.0";
  
  src = /home/felix/nixos/data/prefetch/CiscoPacketTracer_900_Ubuntu_64bit.deb;
  
in pkgs.stdenv.mkDerivation {
  inherit pname version src;

  nativeBuildInputs = with pkgs; [
    dpkg
    makeWrapper
    autoPatchelfHook
  ];

  buildInputs = with pkgs; [
    alsa-lib
    dbus
    fontconfig
    freetype
    glib
    libglvnd
    libpulseaudio
    stdenv.cc.cc.lib
    xorg.libX11
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libxcb
    xorg.xcbutilimage
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
    xorg.xcbutilwm
    zlib
  ];

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb -x $src .
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/opt/pt
    mkdir -p $out/bin
    
    cp opt/pt/packettracer.AppImage $out/opt/pt/
    chmod +x $out/opt/pt/packettracer.AppImage
    
    # Extract the AppImage
    cd $out/opt/pt
    ./packettracer.AppImage --appimage-extract
    rm packettracer.AppImage
    mv squashfs-root packettracer
    
    # Create wrapper script
    makeWrapper $out/opt/pt/packettracer/bin/PacketTracer9 $out/bin/packettracer \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}"
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "Network simulation tool from Cisco (version 9)";
    homepage = "https://www.netacad.com/courses/packet-tracer";
    license = licenses.unfree;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
  };
}
