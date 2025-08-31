{ self, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "hoshimi-miyabi-cursor";
  version = "1.0";
  
  src = "${self}/data/cursors/hoshimi-miyabi";
  
  dontBuild = true;
  
  installPhase = ''
    mkdir -p $out/share/icons/hoshimi-miyabi
    cp -r $src/* $out/share/icons/hoshimi-miyabi/
    chmod -R 755 $out/share/icons/hoshimi-miyabi
  '';

  meta = with pkgs.lib; {
    description = "Hoshimi Miyabi cursor theme from ZZZ";
    platforms = platforms.linux;
    maintainers = [ ];
  };
}