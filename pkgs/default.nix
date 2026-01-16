{ self, pkgs }:

{
	gnomeCursors.hoshimi-miyabi = import ./gnomeCursors/hoshimi-miyabi.nix { inherit self pkgs; };
	gnomeCursors.breezeX = import ./gnomeCursors/breezeX.nix { inherit self pkgs; };
	ciscoPacketTracer9 = import ./packettracer9.nix { inherit pkgs; lib = pkgs.lib; };
}