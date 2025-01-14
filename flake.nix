{
  description = "Mansoor Faqiri's NixOS flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

      nvf = {
      url = "github:notashelf/nvf";
      # You can override the input nixpkgs to follow your system's
      # instance of nixpkgs. This is safe to do as nvf does not depend
      # on a binary cache.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nvf, lanzaboote, ... }:
    let
        system = "x86_64-linux";

        pkgs = import nixpkgs {
            inherit system;

            config = {
                allowUnfree = true;
            };
        };

        in
        {
            nixosConfigurations = {
                myNixos = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit system; };

                    modules = [

                        nvf.nixosModules.default

                        ./nixos/configuration.nix

                        lanzaboote.nixosModules.lanzaboote

			            ./nixos/secure-boot.nix

                ];
            };
        };

    };

}
