{ self, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "gnomeCursors.hoshimi-miyabi";
  version = "1.0";
  
  src = "${self}/data/cursors/hoshimi-miyabi";
	
	installPhase = ''
		mkdir -p $out/share/icons
		cp -r . $out/share/icons/hoshimi-miyabi
	'';

	meta = with pkgs.lib; {
		description = "Hoshimi Miyabi cursor theme";
		platforms = platforms.linux;
	};
}