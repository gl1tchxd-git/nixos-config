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

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nixpkgs-master,
      nixpkgs,
      home-manager,
      git-hooks,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkPkgsOverlays = system: [
        (final: prev: {
          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        })
        (final: prev: {
          master = import nixpkgs-master {
            inherit system;
            config.allowUnfree = true;
          };
        })
        (final: prev: {
          myPackages = import ./pkgs {
            pkgs = final;
          };
        })
      ];
    in
    {
      checks.${system}.pre-commit-check = git-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          nixfmt-rfc-style.enable = true;
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
      };

      nixosConfigurations = {
        laptop-felix = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            {
              nixpkgs.config.allowUnfree = true;
              nixpkgs.overlays = mkPkgsOverlays system;
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

        desktop-felix = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            {
              nixpkgs.config.allowUnfree = true;
              nixpkgs.overlays = mkPkgsOverlays system;
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
