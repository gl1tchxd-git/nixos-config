{ self, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "gnomeCursors.breezeX";
  version = "1.0";
  
  src = "${self}/data/cursors/breezeX";
	
	installPhase = ''
		mkdir -p $out/share/icons
		cp -r . $out/share/icons/breezeX
	'';

	meta = with pkgs.lib; {
		description = "KDE BreezeX cursor theme";
		platforms = platforms.linux;
	};
}