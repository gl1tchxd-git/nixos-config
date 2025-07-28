{ self, pkgs }:

{
	gnomeCursors.hoshimi-miyabi = import ./gnomeCursors.hoshimi-miyabi.nix { inherit self pkgs; };
}