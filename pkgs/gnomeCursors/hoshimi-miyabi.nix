# Update your pkgs/cursors/hoshimi-miyabi.nix
{ self, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "hoshimi-miyabi-cursors";
  version = "1.0";
  
  src = "${self}/data/cursors/hoshimi-miyabi";
  
  dontBuild = true;
  dontConfigure = true;
  
  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/share/icons/Hoshimi-miyabi
    cp -r $src/* $out/share/icons/Hoshimi-miyabi/
    
    # Ensure proper permissions
    find $out/share/icons/Hoshimi-miyabi -type d -exec chmod 755 {} \;
    find $out/share/icons/Hoshimi-miyabi -type f -exec chmod 644 {} \;
    
    # Create cursor.theme for better compatibility
    cat > $out/share/icons/Hoshimi-miyabi/cursor.theme << EOF
[Icon Theme]
Name=Hoshimi-miyabi
Comment=Hoshimi Miyabi from ZZZ
Inherits=Adwaita
EOF
    
    # Update icon cache
    if [ -x "${pkgs.gtk3}/bin/gtk-update-icon-cache" ]; then
      ${pkgs.gtk3}/bin/gtk-update-icon-cache $out/share/icons/Hoshimi-miyabi 2>/dev/null || true
    fi
    
    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "Hoshimi Miyabi cursor theme from ZZZ";
    platforms = platforms.all;
  };
}