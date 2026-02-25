{
  description = "Nixos config flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs-unstable, nixpkgs-master, nixpkgs, home-manager, ... }@inputs:
  let
    inherit (self) outputs;
  in
  {
    nixosConfigurations = {
      laptop-felix = 
      let
        system = "x86_64-linux";
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-master = import nixpkgs-master {
          inherit system;
          config.allowUnfree = true;
        };
      in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs outputs; };
        modules = [
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              (final: prev: {
                unstable = pkgs-unstable;
              })
              (final: prev: {
                master = pkgs-master;
              })
              (final: prev: {
                myPackages = import ./pkgs { pkgs = final; inherit self; };
              })
            ];
          }
          ./hosts/laptop-felix/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              extraSpecialArgs = { inherit inputs outputs; };
              users.felix = import ./hosts/laptop-felix/home.nix;
            };
          }
        ];
      };

      desktop-felix = 
      let
        system = "x86_64-linux";
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-master = import nixpkgs-master {
          inherit system;
          config.allowUnfree = true;
        };
      in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs outputs; };
        modules = [
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              (final: prev: {
                unstable = pkgs-unstable;
              })
              (final: prev: {
                master = pkgs-master;
              })
              (final: prev: {
                myPackages = import ./pkgs { pkgs = final; inherit self; };
              })
            ];
          }
          ./hosts/desktop-felix/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-backup";
              extraSpecialArgs = { inherit inputs outputs; };
              users.felix = import ./hosts/desktop-felix/home.nix;
            };
          }
        ];
      };
    };
  };
}