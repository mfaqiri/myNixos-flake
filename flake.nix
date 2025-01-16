{
  description = "Mansoor Faqiri's NixOS flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { nixpkgs, ...}:
    let
        system = "x86_64-linux";

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

    };

}
