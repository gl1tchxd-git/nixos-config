{
  description = "Nixos config flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs-unstable, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    overlay = final: prev: {
      myPackages = import ./pkgs { pkgs = final; inherit self; };
      unstable = unstable;
    };
  in
  {
    nixosConfigurations = {
      laptop-felix = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs self; };
        modules = [
          {
            nixpkgs.pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
              overlays = [ overlay ];
            };
          }
          ./hosts/laptop-felix/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit self inputs unstable; }; # pkgs.unstable will be available here
              users.felix = import ./hosts/laptop-felix/home.nix;
            };
          }
        ];
      };

      desktop-felix = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs self; };
        modules = [
          {
            nixpkgs.pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
              overlays = [ overlay ];
            };
          }
          ./hosts/desktop-felix/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs self; }; # pkgs.unstable will be available here
              users.felix = import ./hosts/desktop-felix/home.nix;
            };
          }
        ];
      };
    };
  };
}
