{
	description = "A flaky flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		home-manager.url = "github:nix-community/home-manager";
	};

	outputs = { self, nixpkgs, home-manager, ... }:
		let 
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = import nixpkgs {
                          system = system;
                          config.allowUnfreePredicate = _: true;
                        };
		in { 
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [ 
                                  ./configuration.nix 
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
				modules = [ ./home.nix ];
			};
                };
	      };
}

