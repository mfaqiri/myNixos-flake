{
  description = "Mansoor Faqiri's NixOS flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager = {
            url = "github:nix-community/home-manager?ref=release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, ...}@inputs:
    let
        system = "x86_64-linux";
        in
        {
            nixosConfigurations = {
                myNixos = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit system; inherit inputs; };

                    modules = [
                        ./nixos/configuration.nix
                        inputs.home-manager.nixosModules.default
                ];
            };
        };

    };

}
