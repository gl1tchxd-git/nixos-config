{ pkgs }:

{
  gnomeCursors.hoshimi-miyabi = import ./gnomeCursors/hoshimi-miyabi.nix { inherit pkgs; };
  gnomeCursors.breezeX = import ./gnomeCursors/breezeX.nix { inherit pkgs; };
}
