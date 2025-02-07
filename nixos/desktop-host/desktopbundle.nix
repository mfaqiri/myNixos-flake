{ lib, config, ... }: {

    options = {
        desktopbundle.enable = lib.mkEnableOption "enables desktop bundle";
    };

    config = lib.mkIf config.desktopbundle.enable {
    };

    imports = [
        ./audio.nix
        ./disks.nix
        ./games.nix
        ./hardware.nix
        ./network.nix
        ./security.nix
        ./video.nix
    ];
}
