{
  description = "Mansoor Faqiri's NixOS flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, home-manager, nvf, ...}:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

        in
        {
            nixosConfigurations = {
                myNixos = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit system; };

                    modules = [
                        ./nixos/configuration.nix
                ];
            };
        };

      homeConfigurations."mfaqiri" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
                    nvf.homeManagerModules.default
                    ./home-manager/home.nix
                ];
        desktopbundle.enable = true;

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    };

}
