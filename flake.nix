{
  description = "A flaky flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-colors,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      config.allowUnfreePredicate = _: true;
    };
  in {
    nixosConfigurations = {
      hp-laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixos-hp-laptop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
      virtualbox = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixos-virtualbox
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
    };
    homeConfigurations = {
      anthony = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home.nix];
        extraSpecialArgs = {inherit nix-colors;};
      };
    };
  };
}
