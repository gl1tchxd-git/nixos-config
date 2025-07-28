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
    overlay = final: prev: {
      myPackages = import ./pkgs { pkgs = final; inherit self; };
    };
  in
  {
    nixosConfigurations = {
      laptop-felix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ({ config, lib, ... }: {
            nixpkgs.pkgs = import nixpkgs {
              system = "x86_64-linux";
              config.allowUnfree = true;
              overlays = [ overlay ];
            };
          })

          ({ ... }: {
            _module.args.unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          })

          ./hosts/laptop-felix/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.felix = import ./hosts/laptop-felix/home.nix;
          }
        ];
      };

      desktop-felix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ({ config, lib, ... }: {
            nixpkgs.pkgs = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
              overlays = [ overlay ];
            };
          })

          ./hosts/desktop-felix/configuration.nix
#           home-manager.nixosModules.default
#           {
#             home-manager.useGlobalPkgs = true;
#             home-manager.useUserPackages = true;
#             home-manager.users.felix = import ./hosts/desktop-felix/home.nix;
#           }
        ];
      };
    };
  };
}